class User::PlansController < ApplicationController
  # before_action :purposes_string, only: [:create, :update\
   #チェックボックスの値を文字列表示にするため、createとupdateの前に必ず実行

  def new
    @plan = Plan.new
    @plan_spot_lists = @plan.plan_spot_lists.build
    @actions = @plan.actions.build
  end

  def create
    @plan = Plan.new(plan_params)
    tag_list = params[:plan][:name].split(',')
    @plan.purposes = params[:plan][:purposes].join(' ') if params[:plan][:purposes]
    # 投稿ボタンを押下した場合
    if params[:post]
      if @plan.save(context: :publicize, is_draft: false)
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
    @plans = Plan.where(is_draft: 'false')
    @tag_list=Tag.all
    if params[:plan_title].present?
      @plans_search = Plan.where('plan_title LIKE ?', "%#{params[:plan_title]}%")
    else
      @plans_search = Plan.none
    end
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
        render :edit, alert: "計画を公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ②公開済みレシピの更新の場合
    elsif params[:update_post]
      @plan.attributes = plan_params
      if @plan.save(context: :publicize)
         @old_relations=PostTag.where(plan_id: @plan.id)
          @old_relations.each do |relation|
          relation.delete
        end
         @plan.save_tag(tag_list)
        redirect_to plan_path(@plan.id), notice: "計画を更新しました！"
      else
        render :edit, alert: "計画を更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ③下書きレシピの更新（非公開）の場合
    else
      if @plan.update(plan_params)
          @old_relations=PostTag.where(plan_id: @plan.id)
          @old_relations.each do |relation|
          relation.delete
        end
         @plan.save_tag(tag_list)
        redirect_to plan_path(@plan.id), notice: "下書きを更新しました！"
      else
        render :edit, alert: "下書き更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    @tag=Tag.find(params[:tag_id])
    @plans=@tag.plans.all
  end

  private

  def plan_params
    params.require(:plan).permit(:plan_title, :departure, :arrival, :days, :budget, :purpose_spot, :important_point_1, :important_point_2, :important_point_3, :important_point_4, :important_point_5, :count, :memo, :cost_sum, :checkbox, purposes:[], plan_spot_lists_attributes:[:id, :spot_list, :evaluation, :_destroy], actions_attributes:[:id, :action, :action_detail, :action_datetime, :cost, :_destroy]).merge(customer_id: current_customer.id)
  end

  # def purposes_string
  # params[:plan][:purposes] = params[:plan][:purposes].join("/") # to string
  # end

end