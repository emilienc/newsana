class CreateActivites < ActiveRecord::Migration
  def change
    create_table :activites do |t|
      t.integer :category_activite_id
      t.integer :duree
      t.integer :user_id
      t.date :quand

      t.timestamps
    end
  end
end
