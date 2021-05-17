class RequestController < ApplicationController
  after_action :verify_authorized
  after_action :verify_policy_scoped, only:[:index, :show, :edit]
  before_action :authenticate_user!, only:[:index, :show, :new]

  def index
    @request = policy_scope(Request)
    authorize @request
  end
  
  def new
    
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

end
