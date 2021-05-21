class Employee::RequestsController < Employee::BaseController
  before_action :authenticate_user!
  before_action :default_request, only: [:show]
   
  def index
    user = User.find_by(id: current_user.id)
    @requests_list = user.requests

    @requests = if params[:term]
      @requests_list.search(params[:term])
    else
      @requests = @requests_list
    end
  end
  
  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.build(request_params)

    if @request.save
      flash[:notice] = 'This user was saved successfully'
      redirect_to employee_requests_path 
    else 
      render :new
    end
  end

  private

  def default_request
    @user = User.find_by(id: current_user.id)
    @requests = @user.requests
  end

  def request_params
    params.require(:request).permit(:item_id, :type_request, :start_date, :end_date, :reason, :status).with_defaults(status: 'pending')
  end
end
