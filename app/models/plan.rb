class Plan < ApplicationRecord
  belongs_to :customer
  
  enum purpose: { yukkurinonbiri: 0, gurume: 1, activity: 2, onsen: 3, sansaku: 4, bae: 5, kankou: 6, refresh: 7, deai: 8 }
end
