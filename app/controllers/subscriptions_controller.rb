class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = current_user.subscriptions.all
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    tag_value = subscription_params["user_entry"]

    #If the tag_value is empty, we match everything, so build a notification for the entire Tell collection
    #Else search through Tell collection by subscription type, generating notifications for matching tags
    case subscription_params["subscription_type"]
      #Type = title
      when "0"
        @subscription = current_user.subscriptions.build({"title"=>tag_value, "subscription_type"=>0})
        
        tells = Tell.where(title: tag_value)
        tells.each do |tell|
          @subscription.notifications.build({"tell_id"=>tell.id})
        end
      #Type = teller
      when "1"
        @subscription = current_user.subscriptions.build({"teller"=>tag_value, "subscription_type"=>1})

        tells = Tell.where(tellerName: tag_value)
        tells.each do |tell|
          @subscription.notifications.build({"tell_id"=>tell.id})
        end
      #Type = keyword
      when "2"
        @subscription = current_user.subscriptions.build({"keyword"=>tag_value, "subscription_type"=>2})

        tells = Tell.where(keyword: tag_value)
        tells.each do |tell|
          @subscription.notifications.build({"tell_id"=>tell.id})
        end
      else
        puts "Something went wrong..."
      end
    if tag_value == ""
      tells = Tell.all
    end
    tells.each do |tell|
          @subscription.notifications.build({"tell_id"=>tell.id})
    end

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:user_entry, :subscription_type)
    end
end
