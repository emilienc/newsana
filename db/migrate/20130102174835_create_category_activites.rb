class CreateCategoryActivites < ActiveRecord::Migration
  def change
    create_table :category_activites do |t|
      t.string :name
      t.float :MET
      t.timestamps
    end
  end
end
