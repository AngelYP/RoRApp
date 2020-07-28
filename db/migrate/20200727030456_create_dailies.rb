class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.integer :positives
      t.integer :deaths
      t.integer :actives
      t.integer :recovered
      t.integer :suspects
      t.integer :negatives

      t.timestamps
    end
  end
end
