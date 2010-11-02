class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.string :main_url
      t.string :events_url
      t.string :kind
      t.string :event_tel
      t.string :twitter

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
