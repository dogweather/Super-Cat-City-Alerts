class AddCityToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :city, :string
  end

  def self.down
    remove_column :events, :city
  end
end
