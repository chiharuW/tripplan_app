class User::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    plan = Plan.find(params[:plan_id])
    favorite = current_customer.favorites.new(plan_id: plan.id)
    favorite.save
    redirect_to plan_path(plan)
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    favorite = current_customer.favorites.find_by(plan_id: plan.id)
    favorite.destroy
    redirect_to plan_path(plan)
  end
end
