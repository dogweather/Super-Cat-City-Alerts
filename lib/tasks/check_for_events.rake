require 'grackle'
require 'supercat/string'
require 'supercat/parsers'

#
# Configuration
#

# Whether to run curl and retrieve the web pages.
# Set to false for testing.
REFRESH_PAGES = true

#
# End of configuration
#

namespace :events do
  desc "Check for new events and send notifications."
  task :check_and_send => :environment do

    #
    # Tell the world about this event.
    #
    def broadcast(event)
      puts "BROADCASTING NEW EVENT:"
      pp(event)
      client = Grackle::Client.new(
                                   :auth => {
                                     :type => :oauth,
                                     :consumer_key => TWITTER_CONSUMER_KEY,
                                     :consumer_secret => TWITTER_CONSUMER_SECRET,
                                     :token => TWITTER_ACCESS_TOKEN,
                                     :token_secret => TWITTER_ACCESS_TOKEN_SECRET
                                   })
      
      # Make the info Twitter-friendly & clean it up a bit.
      info_url = 'http://bit.ly/1pd0B3' # Todo: "http://srsly.co/e/#{event.id}"
      problem  = "#{event.service.kind.titleize} outage"
      city     = event.city.gsub(' ', '') + 'Oregon'
      eta      = event.fix_eta.strftime("%l:%M%P").strip  # 10:10pm
      cause    = event.cause
      if cause == 'unknown'
        cause = 'cause unknown'
      end
      # Finally:
      message = "#{problem} - #{cause} - est. fixed by #{eta} #{info_url} #zip#{event.zipcode} ##{city} #blackout"
      
      client.statuses.update!({
                                :status => message,
                                :lat    => event.latitude,
                                :long   => event.longitude
                              })
    end


    #
    # Beginning of execution
    #
    event_list = []
    if REFRESH_PAGES
      `script/get_pge_pages.sh 2> /dev/null`
    end
    
    for page in `ls downloads/pge*`.map{|p| p.chomp}
      events = Parsers::PGE_Parser.parse_file(page)
      event_list << events
      event_list.flatten!
    end
    
    for e in event_list
      # Can we save it? If so, it's new and we'll
      # broadcast it.
      if e.save
        broadcast(e)
      end
    end
  end

end
