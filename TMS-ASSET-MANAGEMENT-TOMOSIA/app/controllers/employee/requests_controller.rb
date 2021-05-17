class Employee::RequestsController < Employee::BaseController
  before_action :authenticate_user!
   
  def index
  end

  def new
  end

  def create
    @requests = current_user.requests.build(request_params)
    if @requests.save
      
  end

  private

  def request_params
    params.require(:requests).permit(:device, :type, :start_date_request, :end_date_request, :reason)
  end
end
