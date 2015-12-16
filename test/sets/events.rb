module Contexts
  module Events
    # ======= Context for Events ==========
    def create_events
      @event_0 = FactoryGirl.create(:event, start: 10.hours.ago)
      @event_1 = FactoryGirl.create(:event)
    end
    
    def destroy_events
      @event_0.delete
      @event_1.delete
    end
  end
end