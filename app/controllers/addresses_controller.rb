class AddressesController < ApplicationController

  def new; end

  def create
    @address = current_user.addresses.build address_params
    @address.save
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update address_params
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
  end

  private

  def address_params
    params.require(:address).permit :phone, :address, :city, :country
  end
end
