class CreateAliments < ActiveRecord::Migration
  def change
    create_table :aliments do |t|
      t.string :name
      t.integer :calories
      t.integer :unite_id
      t.integer :portion
      t.timestamps
    end
  end
end
