class CreateCostGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_groups do |t|
      t.references :cost, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
