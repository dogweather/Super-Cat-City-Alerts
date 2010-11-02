class AddCauseToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :cause, :string
  end

  def self.down
    remove_column :events, :cause
  end
end
