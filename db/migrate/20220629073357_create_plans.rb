class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
    	t.integer  :customer_id,      null: false
    	t.string   :plan_title,   null: false
    	t.date     :departure
    	t.date     :arrival
    	t.integer  :days
    	t.integer  :budget
    	t.string   :purposes
      t.string   :purpose_spot
      t.string   :important_point_1
      t.string   :important_point_2
      t.string   :important_point_3
      t.string   :important_point_4
      t.string   :important_point_5
      t.integer  :count
      t.text     :memo
      # t.string   :action
      # t.string   :action_detail
      # t.datetime :action_datetime
      # t.integer  :cost
      t.integer  :cost_sum
      t.boolean  :is_draft, default: false
      # t.float    :evaluation
      t.timestamps
    end
  end
end
