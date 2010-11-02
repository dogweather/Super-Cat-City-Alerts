class AddServiceIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :service_id, :integer
  end

  def self.down
    remove_column :events, :service_id
  end
end
