class CreatePesees < ActiveRecord::Migration
  def change
    create_table :pesees do |t|
      t.date :quand
      t.integer :what
      t.integer :user_id

      t.timestamps
    end
  end
end
