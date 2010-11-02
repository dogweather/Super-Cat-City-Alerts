class AddStateToZipcode < ActiveRecord::Migration
  def self.up
    add_column :zipcodes, :state, :string
  end

  def self.down
    remove_column :zipcodes, :state
  end
end
