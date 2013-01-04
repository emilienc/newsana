class AddComportementToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :comportement, :string
  end
end
