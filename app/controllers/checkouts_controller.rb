class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_order

  def new; end

  def index
    @address = Address.find(params[:address_id])
  end

end
