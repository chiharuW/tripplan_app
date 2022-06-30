class Plan < ApplicationRecord
  belongs_to :customer
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def bookmarked_by?(customer)
   bookmarks.exists?(customer_id: customer.id)
  end
  
  def favorited_by?(customer)
   favorites.exists?(customer_id: customer.id)
  end
  
  #enum purpose: { yukkurinonbiri: 0, gurume: 1, activity: 2, onsen: 3, sansaku: 4, bae: 5, kankou: 6, refresh: 7, deai: 8 }
end
