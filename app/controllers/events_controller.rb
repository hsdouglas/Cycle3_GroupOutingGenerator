class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.chronological.all
    @events_attendance = Array.new(@events.length)

    @events_attendance = @events.map do |event|
      event.purchased_tickets
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @purchased = @event.purchased_tickets
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # A simple form that is submitted through AJAX.
  def buyticket
    @ticket = Ticket.new(ticket_params)
    @event = Event.find(@ticket.event_id)
    if @ticket.valid?
      @ticket.save
      # this will have to change to credit card functionality later
      redirect_to events_url, notice: 'You successfully purchased your ticket to this event.'
      # redirect to my groups url (when logged in!)
    else
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

  def grouptickets
    @event.group_tickets
    #redirect_to tickets_url, notice: 'You successfully grouped the available tickets.'

    @tickets = Ticket.for_event(@event).ungrouped[0..5]
    if tickets.count % 6 == 0
      newest = Group.new(title: "#{self.title} Group")
      newest.save!

      tickets.each do |ticket|
        ticket.group = newest
        ticket.save!
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :poster, :start, :venue_title, :address_1, :address_2, :city, :state, :zip)
    end

    def ticket_params
      params.require(:ticket).permit(:event_id, :user_id, :date_purchased)
    end
end
