class PublisherController < ApplicationController
  include Wisper::Publisher

  def publish_tell
  	@tell = Tell.find(params[:id])
    publish(:tell_publish, @tell)
    redirect_to @tell, notice: 'Tell was successfully published.'
  end
end
