class AddAddressToData < ActiveRecord::Migration
  def self.up
    add_column :data, :address, :string
  end

  def self.down
    remove_column :data, :address
  end
end
