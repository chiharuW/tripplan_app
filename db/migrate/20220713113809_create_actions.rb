class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.references :plan,       null: false, foreign_key: true
      t.string   :action
      t.string   :action_detail
      t.datetime :action_datetime
      t.integer  :cost
    
      t.timestamps
    end
  end
end
