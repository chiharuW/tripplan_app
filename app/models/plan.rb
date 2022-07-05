class Plan < ApplicationRecord
  belongs_to :customer
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :important_point, dependent: :destroy

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def favorited_by?(customer)
   favorites.where(customer_id: customer).exists?
  end
  
   with_options presence: true, on: :publicize do
    validates :plan_title
    validates :departure
    validates :arrival
    validates :days
    validates :budget
    validates :purpose_spot
    validates :count
    validates :spot_list
    validates :memo
    validates :cost
    validates :cost_sum
    validates :action
    validates :action_detail
    validates :action_date
    validates :action_time
    validates :purpose
  end
  validates :plan_title, length: { maximum: 14 }, on: :publicize

  #enum purpose: { yukkurinonbiri: 0, gurume: 1, activity: 2, onsen: 3, sansaku: 4, bae: 5, kankou: 6, refresh: 7, deai: 8 }
end
