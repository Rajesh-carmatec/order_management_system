class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @food_items = @order.food_items
    @total_price = @food_items.pluck(:price).sum
    @address = @user.addresses.get_current_address
    @all_payment_types = PaymentType.all
    @payment_types = PaymentMethod.all
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order saved successfully."
      redirect_to order_path(@order.id)
    else
      flash[:alert] = "Failed to create order successfully."
      redirect_to new_order_path
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(
                                :tittle,
                                :description,
                                :time_slot,
                                :status,
                                food_items_attributes: [:id, :name, :description, :price, :_destroy])
    end
end
