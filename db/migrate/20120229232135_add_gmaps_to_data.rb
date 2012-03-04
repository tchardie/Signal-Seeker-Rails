class AddGmapsToData < ActiveRecord::Migration
  def self.up
    add_column :data, :gmaps, :boolean
  end

  def self.down
    remove_column :data, :gmaps
  end
end
