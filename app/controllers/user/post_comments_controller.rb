class User::PostCommentsController < ApplicationController

  def create
    plan = Plan.find(params[:plan_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.plan_id = plan.id
    comment.save
    redirect_to plan_path(plan)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to plan_path(params[:plan_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
