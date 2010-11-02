class Event < ActiveRecord::Base
  belongs_to :service

  validates_presence_of   :zipcode, :happened_at, :latitude, :longitude, :service_id, :city
  validates_uniqueness_of :zipcode, :scope => :happened_at
end
