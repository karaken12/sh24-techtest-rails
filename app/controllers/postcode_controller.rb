class PostcodeController < ApplicationController
  def index; end

  def search
    @postcode = params[:postcode]
    @shippable = (@postcode == 'abc123')
    render :search
  end
end
