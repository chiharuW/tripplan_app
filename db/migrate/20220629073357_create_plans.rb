class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
    	t.integer  :customer_id,      null: false
    	t.string   :plan_title,   null: false
    	t.date     :departure
    	t.date     :arrival
    	t.integer  :days
    	t.integer  :budget
    	t.string   :purpose
      t.string   :purpose_spot
      t.integer  :count
      t.text     :spot_list
      t.text     :memo
      t.integer  :cost
      t.integer  :cost_sum
      t.string   :action
      t.string   :action_detail
      t.date     :action_date
      t.time     :action_time
      t.boolean  :is_draft, default: true
      t.timestamps
    end
  end
end
