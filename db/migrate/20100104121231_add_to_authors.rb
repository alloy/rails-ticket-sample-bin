class AddToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :owner, :boolean
    add_column :authors, :admin, :boolean
  end

  def self.down
    remove_column :authors, :admin
    remove_column :authors, :owner
  end
end
