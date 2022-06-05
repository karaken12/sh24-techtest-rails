class PostcodeController < ApplicationController
  def index; end

  def search
    @postcode = params[:postcode]
    @shippable = PostcodeCheckService.new.shippable?(@postcode)

    render :search
  end
end
