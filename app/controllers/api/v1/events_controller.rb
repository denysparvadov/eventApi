class Api::V1::EventsController < ApplicationController

  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    render formats: :json
  end

  def show
    render formats: :json
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render formats: [:json, status: :created, location: @event]
      # , status: :created, location: @event]
    else
      render formats: [:json, status: :unprocessable_entity]
      # , status: :unprocessable_entity]
    end
  end

  def update
    if @event.update(event_params)
      render formats: :json
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params #TODO pry-rails        params
    params.permit(:title, :tickets_amount, :date_start, :date_end)
  end
end
