# require needed files
require './test/sets/events'
require './test/sets/users'
require './test/sets/tickets'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Events
  include Contexts::Users
  include Contexts::Tickets
end