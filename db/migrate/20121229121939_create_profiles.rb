class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :age
      t.integer :user_id
      t.integer :poids
      t.integer :taille

      t.timestamps
    end
  end
end
