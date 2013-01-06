class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :user_id
      t.float :poids
      t.date :duree

      t.timestamps
    end
  end
end
