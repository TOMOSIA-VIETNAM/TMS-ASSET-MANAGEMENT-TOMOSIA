class Admin::RequestsController < Admin::BaseController
  before_action :authenticate_user!
   
  def index
    @requests = Request.status_pending.paginate(page: params[:page], :per_page => 5)
    authorize @requests
  end

  def new
  end

  def edit
    @request = Request.find(params[:id])
    authorize @request
  end

  def create

    @request = Request.find(params[:approve][:request_id])
    authorize @request

    @deliver = @request.build_deliver(approve_params)
    authorize @deliver

    if @deliver.save
      flash[:notice] = 'Deliver was saved.'
      redirect_to admin_requests_path
    else
      flash[:error] = 'There was an error saving the deliver. Please try again.'
    end
   
    if @request.update(:status => 'approve')
      flash[:notice] = 'Deliver was saved.'
    else
      flash[:error] = 'There was an error saving the request. Please try again.'
    end
  end

  def update
    @request = Request.find(params[:id])
    authorize @request

    if @request.update(reject_params)
      flash[:notice] = 'Status was updated.'  
      redirect_to admin_requests_path
    else
      flash[:error] = 'There was an error saving the request. Please try again.'
    end

  end

  private

  def policy_scope(scope)
    super([:admin, scope])
  end

  def authorize(record, query = nil)
    super([:admin, record], query)
  end

  def approve_params
    params.require(:approve).permit(:item_id, :type_deliver, :start_date, :end_date, :reason, :status, :request_id).with_defaults(status: 'pending')
  end

  def reject_params
    params.require(:request).permit(:note,:status).with_defaults(status: 'reject')
  end
end
