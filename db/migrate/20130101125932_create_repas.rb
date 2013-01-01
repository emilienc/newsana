class CreateRepas < ActiveRecord::Migration
  def change
    create_table :repas do |t|
      t.integer :user_id
      t.date :quand
      t.string :name

      t.timestamps
    end
  end
end
