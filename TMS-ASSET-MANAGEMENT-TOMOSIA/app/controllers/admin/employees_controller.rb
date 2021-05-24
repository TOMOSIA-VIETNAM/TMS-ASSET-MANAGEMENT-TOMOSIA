class Admin::EmployeesController < Admin::BaseController
  before_action :authenticate_user!
  
  def index
    binding.pry
    @employees = User.employees
    authorize @employees
  end


  private

  def policy_scope(scope)
    super([:admin, scope])
  end

  def authorize(record, query = nil)
    super([:admin, record], query)
  end
end
