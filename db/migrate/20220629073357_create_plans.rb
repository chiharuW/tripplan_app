class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
    	t.integer  :customer_id,      null: false
    	t.string   :plan_title,   null: false
    	t.date     :departure,    null: false
    	t.date     :arrival,      null: false
    	t.integer  :days,         null: false
    	t.integer  :budget,       null: false
    	t.string   :purpose
      t.string   :purpose_spot, null: false
      t.integer  :count,        null: false
      t.text     :spot_list,    null: false
      t.text     :memo,         null: false
      t.integer  :cost,         null: false
      t.integer  :cost_sum,     null: false
      t.string   :action,       null: false
      t.string   :action_detail,null: false
      t.date     :action_date,  null: false
      t.time     :action_time,  null: false
      t.boolean  :is_draft, null: false, default: true
      t.timestamps
    end
  end
end
