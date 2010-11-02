require 'supercat/string'
require 'hpricot'

module Parsers
  
  ZIPCODE             = 'zipcode'
  CAUSE               = 'cause'
  TIME                = 'time'
  CUSTOMERS_AFFECTED  = 'customers affected'
  CALLS_RECEIVED      = 'calls received'
  ETA                 = 'ETA'
  LATITUDE            = 'latitude'
  LONGITUDE           = 'longitude'
  CITY                = 'city'
  
  
  class PGE_Parser
    
    #
    # Return parsed events from a PGE Outage
    # HTML page.
    #
    def self.parse_file(a_filename)
      event_list = []
      pge        = Service.find_by_name 'Portland General Electric'
      doc        = open(a_filename) {|f| Hpricot(f) }

      (doc/'table.cssContainer/tr').each do |tr|
        # A content row?
        unless tr.attributes['id'].empty?
          event = Event.new
          event.service = pge
          event.cause   = (tr/'td')[1].inner_text.downcase
          event_zipcode = (tr/'td')[0].inner_text
          event_time    = (tr/'td')[2].inner_text
          event_eta     = (tr/'td')[5].inner_text
          
          # Standardize & fixup some attributes.
          zip = Zipcode.find_by_zip(event_zipcode)
          event.zipcode   = zip.zip
          event.latitude  = zip.lat
          event.longitude = zip.long
          event.city      = zip.city

          event.happened_at = DateTime.parse(event_time + " PDT")
          event.fix_eta     = DateTime.parse(event_eta + " PDT")

          event_list << event
        end
      end
      return event_list
    end  
    
  end
  
end
