class CreateData < ActiveRecord::Migration
  def self.up
    create_table :data do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :location
      t.integer :wifi
      t.integer :cell
      t.string :carrier

      t.timestamps
    end
  end

  def self.down
    drop_table :data
  end
end
