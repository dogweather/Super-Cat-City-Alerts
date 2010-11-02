class Zipcode < ActiveRecord::Base
  validates_presence_of :zip, :city, :state, :lat, :long
  validates_uniqueness_of :zip
end
