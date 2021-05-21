class Employee::RequestsController < Employee::BaseController
  before_action :authenticate_user!
   
  def index
  end
  
  def show
    @user = User.find_by(id: current_user.id)
    @requests = current_user.requests.paginate(page: params[:page], :per_page => 2)
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.build(request_params)

    if @request.save
      redirect_to employee_request_path(current_user.id) 
      flash[:notice] = 'This user was saved successfully'
    else 
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:item_id, :type_request, :start_date, :end_date, :reason, :status).with_defaults(status: 'pending')
  end
end
