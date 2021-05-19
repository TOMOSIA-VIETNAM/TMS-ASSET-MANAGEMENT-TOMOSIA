class Employee::RequestsController < Employee::BaseController
  before_action :authenticate_user!
   
  def index
  end
  
  def show
    @user = User.find_by(id: current_user.id)
    @requests = @user.requests
  end

  def new
  end

  def create
    @request = current_user.requests.build(request_params)
    if @request.save
      redirect_to employee_request_path(current_user.id)
    end
  end

  private

  def request_params
    params.permit(:item_id, :type_request, :start_date, :end_date, :reason, :status).with_defaults(status: "pending")
  end
end
