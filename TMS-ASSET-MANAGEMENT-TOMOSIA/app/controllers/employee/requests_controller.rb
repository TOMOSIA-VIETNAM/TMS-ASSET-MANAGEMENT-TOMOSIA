class Employee::RequestsController < Employee::BaseController
  before_action :authenticate_user!
  before_action :default_request, only: [:show, :change_select]
   
  def index
    user = User.find_by(id: current_user.id)
    @requests_list = user.requests.paginate(page: params[:page], :per_page => 5)
    @requests = if params[:term]
      @requests_list.search(params[:term])
    else
      @requests = @requests_list

    end
  end
  
  def show;end
  
  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.build(request_params)

    if @request.save
      notifier = Slack::Notifier.new Request::WEBHOOK_URL
      notifier.post text:"User Name: #{current_user.name}\n Type Request: #{@request.type_request}\n  Devices: #{@request.item.name}\n Reason: #{@request.reason} "

      flash[:notice] = 'This user was saved successfully'
      redirect_to employee_requests_path 
    else 
      render :new
    end
  end

  def change_select

    if  params[:name] == 'Restore' || params[:name] == 'Break'
      @items = current_user.items
      # respond_to do |format|
      #   format.js {render partial: 'filename' }
      #   format.json { render :json => @items.to_json }
      # end
    else
      @items = Item.items_broken
      # respond_to do |format|
      #   format.js
      #   format.json { render :json => @items.to_json }
      # end 
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
