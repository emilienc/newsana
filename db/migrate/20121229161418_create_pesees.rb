class CreatePesees < ActiveRecord::Migration
  def change
    create_table :pesees do |t|
      t.date :quand
      t.float :what
      t.integer :user_id

      t.timestamps
    end
  end
end
