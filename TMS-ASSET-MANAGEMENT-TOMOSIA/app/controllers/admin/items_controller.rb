class Admin::ItemsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @items_broken_search = Item.items_broken.paginate(page: params[:items_broken], :per_page => 5)
    @items_broken = @items_broken_search.search(params[:search_broken])

    @items_stock_search = Item.items_stock.paginate(page: params[:items_stock], :per_page => 5)
    @items_stock = @items_stock_search.search(params[:search_stock])


    authorize @items_broken
    authorize @items_stock
    authorize @items_broken_search
    authorize @items_stock_search
  end

  private

  def policy_scope(scope)
    super([:admin, scope])
  end

  def authorize(record, query = nil)
    super([:admin, record], query)
  end
end
