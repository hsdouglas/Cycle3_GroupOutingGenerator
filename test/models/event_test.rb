require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  # shoulda matchers
  should have_many(:tickets)
  should have_many(:users).through(:tickets)
  # should have_many(:groups).through(:tickets)

  # context testing
  context "Within context" do
    
    # context setup is failing "NameError: undefined local variable or method"...which is definitely not true so I give up.
    setup do
      create_events
      create_users
      create_tickets
    end

    teardown do
      destroy_tickets
      destroy_users
      destroy_events
    end
    
    should "have working upcoming scope" do 
      assert_equal 1, Event.upcoming.count
    end
    
    should "have a method to group tickets" do
      @event0.group_tickets
      assert_equal 6, @event0.tickets.grouped.count
      assert_equal 0, @event0.first.tickets.ungrouped.count
      assert_not_nil @ticket_5_event_0.group_id
    end

  end
end
