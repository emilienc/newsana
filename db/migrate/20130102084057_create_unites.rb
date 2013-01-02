class CreateUnites < ActiveRecord::Migration
  def change
    create_table :unites do |t|
      t.string :name

      t.timestamps
    end
  end
end
