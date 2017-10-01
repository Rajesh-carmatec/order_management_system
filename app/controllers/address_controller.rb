class AddressController < ApplicationController

  before_action :get_address_object, only: [:new, :show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id 
    if @address.save
      flash[:notice] = "Address saved successfully."
      redirect_to address_path(@address)
    else
      flash[:alert] = "Failed to create address successfully."
    end
  end

  def new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    redirect_to address_index_path
  end

  def show
    
  end

  private

  def get_address_object
    @address = params[:id].present? ? Address.find(params[:id]) : Address.new
  end

  def address_params
    params.require(:address).permit(
                              :addrress_line_1,
                              :addrress_line_2,
                              :pincode,
                              :city,
                              :state,
                              :country,
                              :user_id,
                              :is_current_address
      )
  end
end
