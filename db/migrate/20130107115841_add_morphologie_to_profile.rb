class AddMorphologieToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :morphologie, :string
  end
end
