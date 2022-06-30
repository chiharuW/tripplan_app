class User::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_current_customer

  def show
    @plans = Plan.where(customer_id: current_customer.id)
    @bookmarks = Bookmark.where(customer_id: current_customer.id)
  end

  def edit

  end

  def update
   if @customer.update(customer_params)
     redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
   else
     render :edit
   end
  end

 private

  def set_current_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end