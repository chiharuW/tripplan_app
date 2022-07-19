class Plan < ApplicationRecord
  belongs_to :customer
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :plan_spot_lists, dependent: :destroy
   accepts_nested_attributes_for :plan_spot_lists
  has_many :actions, dependent: :destroy
   accepts_nested_attributes_for :actions
   accepts_nested_attributes_for :actions, allow_destroy: true

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def favorited_by?(customer)
   favorites.where(customer_id: customer).exists?
  end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end


  with_options presence: true, on: :publicize do
    validates :plan_title
    validates :departure
    validates :arrival
    validates :days
    validates :budget
    validates :purpose_spot
    validates :important_point_1
    validates :important_point_2
    validates :important_point_3
    validates :important_point_4
    validates :important_point_5
    validates :count
    validates :memo
    validates :cost_sum
    validates :purposes
  end
  validates :plan_title, length: { maximum: 14 }, on: :publicize

  
end
