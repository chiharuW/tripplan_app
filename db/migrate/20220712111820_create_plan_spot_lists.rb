class CreatePlanSpotLists < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_spot_lists do |t|
      t.references :plan,       null: false, foreign_key: true
      t.string     :spot_list
      t.float      :evaluation
      t.timestamps
    end
  end
end
