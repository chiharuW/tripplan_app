class CreateImportantPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :important_points do |t|
      t.string :important_point_1
      t.string :important_point_2
      t.string :important_point_3
      t.string :important_point_4
      t.string :important_point_5
      t.integer :plan_id

      t.timestamps
    end
  end
end
