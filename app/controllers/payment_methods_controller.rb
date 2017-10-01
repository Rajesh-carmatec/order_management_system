class PaymentMethodsController < ApplicationController

	before_action :set_payment_object
	before_action :get_payment_types

	def get_payment_methods
		@payment_types = PaymentMethod.all
		@ordered_food_items = Order.find(params[:order_id]).food_items
		@total_amount = @ordered_food_items.pluck(:price).sum
	end

	def set_payment_methods
		@payment_method = PaymentMethod.new(payment_method_params)
		if @payment_method.save
			@order = Order.find(params[:payment_method][:order_id])
			@order.update_attributes(status: true)
			flash[:notice] = "Payment was successful for order"
			redirect_to order_path(@order)
		else
			flash[:alert] = "Payment was not successful for order"
			redirect_to order_path(id: params[:order_id])
		end	
	end

	private

	def payment_method_params
		params.require(:payment_method).permit(		
											:amount,
											:payment_type,
											:order_id
										)
	end

	def set_payment_object
		@payment_method = PaymentMethod.new
	end

	def get_payment_types
		@all_payment_types = PaymentType.all
	end
end
