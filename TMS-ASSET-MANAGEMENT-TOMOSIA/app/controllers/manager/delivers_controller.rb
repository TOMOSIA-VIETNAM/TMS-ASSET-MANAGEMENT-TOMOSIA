class Manager::DeliversController < Manager::BaseController
  before_action :authenticate_user!
  before_action :set_deliver, only: [:show, :edit, :update, :destroy]

  def index
    @delivers_list = policy_scope(Deliver).paginate(page: params[:page], :per_page => 5)
    authorize @delivers_list
    @delivers = if params[:term]
      @delivers_list.search(params[:term])
    else
      @delivers = @delivers_list
    end
  end

  def show; end

  def edit ;end 

  def update
    case deliver_params[:status]

    when 'finish'
      if @deliver.update(deliver_params.merge(date_deliver: Time.zone.now.to_date))
        redirect_to manager_delivers_path
        flash[:notice] = 'This user was saved successfully'
      else
        render :edit
      end
    when 'pending'
      if @deliver.update(deliver_params)
        redirect_to manager_delivers_path
        flash[:notice] = 'This user was saved successfully' 
      else
        render :edit
      end
    when 'handling'
      if @deliver.update(deliver_params)
        redirect_to manager_delivers_path
        flash[:notice] = 'This user was saved successfully' 
      else
        render :edit
      end
    else
      render :edit
    end
  end

  private

  def policy_scope(scope)
    super [:manager, scope]
  end

  def authorize(record, query = nil)
    super [:manager, record], query
  end

  def set_deliver
    @deliver = policy_scope(Deliver).find_by(id: params[:id])
    authorize  @deliver
  end

  def deliver_params
    params.require(:deliver).permit(*policy([:manager, @deliver|| deliver]).permitted_attributes)
  end
end
