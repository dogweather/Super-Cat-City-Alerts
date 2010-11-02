class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :zipcode
      t.datetime :happened_at
      t.datetime :fix_eta
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
