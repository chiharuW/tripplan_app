class Action < ApplicationRecord
  belongs_to :plan
  
  enum action: { syupatu: 0, toutyaku: 1, idou: 2, syukuhaku: 3, activety: 4, kyuukei: 5, syokuzi: 6, sonota: 7 }
end
