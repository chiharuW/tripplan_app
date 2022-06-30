class User::BookmarksController < ApplicationController
    before_action :authenticate_customer!

  def create
    @plan = Plan.find(params[:plan_id])
    bookmark = @plan.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @plan = Plan.find(params[:plan_id])
    bookmark = @plan.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
