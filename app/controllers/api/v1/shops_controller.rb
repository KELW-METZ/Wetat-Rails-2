class Api::V1::ShopsController < Api::V1::BaseController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
