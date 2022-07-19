class Action < ApplicationRecord
  belongs_to :plan
  
  enum action: { syupatu: 0, toutyaku: 1, idou: 2, activety: 3, kyuukei: 4, syokuzi: 5, sonota: 6 }
end
