class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :aliment_id
      t.integer :quantite
      t.integer :repa_id
      t.timestamps
    end
  end
end
