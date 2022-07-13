class CreatePlanSpotLists < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_spot_lists do |t|
      t.references :plan,       null: false, foreign_key: true
      t.integer    :spot_list
      t.float      :evaluation
      t.timestamps
    end
  end
end
