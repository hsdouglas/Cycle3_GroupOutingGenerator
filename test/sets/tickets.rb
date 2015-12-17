module Contexts
  module Tickets
    # ======= Context for Tickets ==========
    def create_tickets
      @ticket_0_event_0 = FactoryGirl.create(:ticket, event: @event_0, user: @user_0)
      @ticket_1_event_0 = FactoryGirl.create(:ticket, event: @event_0, user: @user_1)
      @ticket_2_event_0 = FactoryGirl.create(:ticket, event: @event_0, user: @user_2)
      @ticket_3_event_0 = FactoryGirl.create(:ticket, event: @event_0, user: @user_3)
      @ticket_4_event_0 = FactoryGirl.create(:ticket, event: @event_0, user: @user_4)
      @ticket_5_event_0 = FactoryGirl.create(:ticket, event: @event_0, user: @user_5)
    end

    def destroy_tickets
      @ticket_0_event_0.delete
      @ticket_1_event_0.delete
      @ticket_2_event_0.delete
      @ticket_3_event_0.delete
      @ticket_4_event_0.delete
      @ticket_5_event_0.delete
    end
  end
end