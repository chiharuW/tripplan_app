class User::PostCommentsController < ApplicationController
  before_action :authenticate_customer!


  def create
    plan = Plan.find(params[:plan_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.plan_id = plan.id
    if comment.save
       redirect_to plan_path(plan), notice: "コメントを送信しました！"
    else 
       render :new, alert:"コメントを送信できませんでした"
    end
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
