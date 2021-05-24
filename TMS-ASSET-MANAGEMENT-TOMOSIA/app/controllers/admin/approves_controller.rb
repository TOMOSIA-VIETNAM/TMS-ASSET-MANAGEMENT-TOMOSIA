class Admin::ApprovesController < Admin::BaseController
  before_action :authenticate_user!
   
  def index
    @approves = Request.status_pending.paginate(page: params[:page], :per_page => 5)
  end

  def new
  end

end
