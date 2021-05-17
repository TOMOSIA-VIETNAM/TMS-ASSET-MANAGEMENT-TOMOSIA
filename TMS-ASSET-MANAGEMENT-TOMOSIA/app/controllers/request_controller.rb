class RequestController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show, :new]

  def index
    byebug
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
