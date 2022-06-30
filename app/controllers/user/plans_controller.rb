class User::PlansController < ApplicationController
  before_action :purpose_string, only: [:create, :update] # #チェックボックスの値を文字列表示にするため、createとupdateの前に必ず実行


  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save ? (redirect_to plan_path(@plan)) : (render :new)
  end

  def purpose_string #チェックボックスの値を文字列表示にする
   params[:plan][:purpose] = params[:plan][:purpose].join("/") # to string
  end

  private

  def plan_params
    params.require(:plan).permit(:customer_id, :plan_title, :departure, :arrival, :days, :budget, :purpose_spot, :count,
                                  :spot_list, :memo, :cost, :cost_sum, :action, :action_detail, :action_date, :action_time, purpose:[])
  end

end
