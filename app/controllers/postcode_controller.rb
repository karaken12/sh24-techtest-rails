class PostcodeController < ApplicationController
  def index; end

  def search
    @postcode = params[:postcode]
    render :search
  end
end
