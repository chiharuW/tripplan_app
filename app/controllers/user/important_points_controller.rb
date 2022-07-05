class User::ImportantPointsController < ApplicationController
  
  def create
    plan = Plan.find(params[:plan_id])
    important_point = current_customer.important_point.new(important_point_params)
    important_point.plan_id = plan_id
    important_point.save
    redirect_to plan_path(plan)
  end
  
  private
  
  def important_point_params
    params.require(:important_point).permit(:important_point_1, :important_point_2, :important_point_3, :important_point_4, :important_point_5)
  end
end
