class CreateAliments < ActiveRecord::Migration
  def change
    create_table :aliments do |t|
      t.string :name
      t.integer :calories
      t.integer :proteines
      t.integer :glucides
      t.integer :lipides
      t.integer :quantite
      t.string :unite

      t.timestamps
    end
  end
end
