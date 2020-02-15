class NotificationsController < ApplicationController
  def destroy
  	@notification = Notification.find(params[:id])
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Notification dismissed' }
      format.json { head :no_content }
    end
  end
end
