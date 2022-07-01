class Plan < ApplicationRecord
  belongs_to :customer
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def favorited_by?(customer)
   favorites.where(customer_id: customer).exists?
  end

  #enum purpose: { yukkurinonbiri: 0, gurume: 1, activity: 2, onsen: 3, sansaku: 4, bae: 5, kankou: 6, refresh: 7, deai: 8 }
end
