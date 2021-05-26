class Manager::DevicesController < Manager::BaseController
  before_action :authenticate_user!
  before_action :set_item, only: [:show]

  def index
    @status_stock_list = Item.status_stock.paginate(page: params[:items_out_stock], :per_page => 6)
    authorize @status_stock_list
    @status_stock = @status_stock_list.search(search_stock: params[:search_stock])

    @status_brokens_list = Item.status_broken.paginate(page: params[:items_broken], :per_page => 6)
    authorize @status_brokens_list
    @status_brokens = @status_brokens_list.search(search_broken: params[:search_broken])
  end

  def show; end

  private

  def policy_scope(scope)
    super [:manager, scope]
  end

  def authorize(record, query = nil)
    super [:manager, record], query
  end

  def set_item
    @item = policy_scope(Item).find_by(id: params[:id])
    authorize @item
  end
end
