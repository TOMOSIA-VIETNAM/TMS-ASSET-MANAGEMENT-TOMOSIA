class Admin::DashboardsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @items_broken = Item.items_broken
    @items_stock = Item.items_stock
    @items_out_stock = Item.items_out_stock
  end
end
