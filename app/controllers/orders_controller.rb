class OrdersController < ApplicationController
  before_action :set_order, only: [:update, :edit, :show, :destroy]
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    if @order.save
      redirect_to orders_path
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Update sucessfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @order.destroy
      redirect_to orders_path, notice: 'Delete sucessfully'
    end
  end

  private
    def order_params
      params.require(:order).permit(:address, :total, :phone_number, :email, :customer_name)
    end

    def set_order
      @order = Order.find(params[:id])
    end
end
