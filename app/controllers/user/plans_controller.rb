class User::PlansController < ApplicationController
  #before_action :purpose_string, only: [:create, :update] # #チェックボックスの値を文字列表示にするため、createとupdateの前に必ず実行

  def new
    @plan = Plan.new
  end

  def create
    # @important_point = ImportantPoint.new
    @plan = Plan.new(plan_params)
    tag_list = params[:plan][:name].split(',')

    # 投稿ボタンを押下した場合
    if params[:post]
      if @plan.save(context: :publicize)
        @plan.save_tag(tag_list)
        redirect_to plan_path(@plan), notice: "計画を投稿しました！"
      else
        render :new, alert: "登録できませんでした。入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    else
      if @plan.update(is_draft: true)
        @plan.save_tag(tag_list)
        redirect_to  mypage_path(current_customer), notice: "下書き保存しました！"
      else
        render :new, alert: "登録できませんでした。入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def index
    @plans = Plan.all
    # @posts = Post.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def show
    @plan = Plan.find(params[:id])
    @post_comment = PostComment.new
    @post_tags = @plan.tags
  end

  def edit
    @plan = Plan.find(params[:id])
    @tag_list = @plan.tags.pluck(:name).join(',')
  end

  def update
    @plan = Plan.find(params[:id])
    tag_list=params[:plan][:name].split(',')
        # ①下書きレシピの更新（公開）の場合
    if params[:publicize_draft]
      # レシピ公開時にバリデーションを実施
      # updateメソッドにはcontextが使用できないため、公開処理にはattributesとsaveメソッドを使用する
      @plan.attributes = plan_params.merge(is_draft: false)
      if @plan.save(context: :publicize)
         @old_relations=PostTag.where(plan_id: @plan.id)
          @old_relations.each do |relation|
          relation.delete
        end  
         @plan.save_tag(tag_list)
        redirect_to plan_path(@plan.id), notice: "下書きを公開しました！"
      else
        @plan.is_draft = true
        render :edit, alert: "を公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ②公開済みレシピの更新の場合
    elsif params[:update_post]
      @plan.attributes = plan_params
      if @plan.save(context: :publicize)
        @plan.save_tag(tag_list)
        redirect_to plan_path(@plan.id), notice: "レシピを更新しました！"
      else
        render :edit, alert: "レシピを更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ③下書きレシピの更新（非公開）の場合
    else
      if @plan.update(plan_params)
        redirect_to plan_path(@plan.id), notice: "下書きレシピを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end


  private

  def plan_params
    params.require(:plan).permit(:plan_title, :departure, :arrival, :days, :budget, :purpose_spot, :count, :spot_list, :memo, :cost, :cost_sum, :action, :action_detail, :action_date, :action_time, :checkbox,　purposes:[]).merge(customer_id: current_customer.id)
  end

end
