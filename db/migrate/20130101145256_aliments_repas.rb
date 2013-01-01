class AlimentsRepas < ActiveRecord::Migration
  def up
  	create_table :aliments_repas, :id=>false do |t|
        t.references :aliment
        t.references :repa
    end
    add_index :aliments_repas, [:aliment_id, :repa_id]
    add_index :aliments_repas, [:repa_id, :aliment_id]
  end

  def down
  	drop_table :aliments_repas
  end
end
