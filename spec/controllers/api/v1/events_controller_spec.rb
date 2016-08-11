require 'rails_helper'


RSpec.describe Api::V1::EventsController, type: :controller do
  let(:event) { FactoryGirl.create(:event) }
  let(:events) { FactoryGirl.create_list(:event, 3) }

  describe 'GET #index' do
    before do
      get :index
    end
    it 'assigns all exvents as @events' do
      expect(assigns(:events))==([events])
    end
    it 'should render to index.json.jbuilder' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: {id: event.to_param}
    end
    it 'assigns the requested event as @event' do
      expect(assigns(:event)).to eq(event)
    end
    it 'should render to show.json.jbuilder' do
      expect(response).to render_template :show
    end
  end
  describe 'DELETE #destroy' do
    before { event }

    it 'should to delete event' do
      expect { delete :destroy, params: {id: event.to_param} }.to change(Event, :count).by(-1)
    end

  end
  describe 'POST #create' do
    it 'creates a new event' do
      expect { post :create, params: {event: event.to_param} } #TODO factory girls attributes_for
          .to change(Event, :count).by(1)
    end
    it 'should render to create.json.jbuilder' do
      post :create, params: {event: event.to_param}
      expect(response).to render_template :create
    end
  end
  describe 'PUT #update' do
    it 'assigns the requested event to @event' do
      put :update, params: {id: event.to_param, event: :event.to_param}
      expect(assigns(:event)).to eq event
    end
    it 'changes events attributes' do
      new_event = FactoryGirl.create(:event)
      put :update, params: {id: event.to_param, event: new_event.to_param}
      event.reload
      expect(event.title).to eq new_event.title
      expect(event.tickets_amount).to eq new_event.tickets_amount
      expect(event.date_start).to eq new_event.date_start
      expect(event.date_end).to eq new_event.date_end
    end
    it 'should render to update.json.jbuilder' do
      put :update, params: {id: event.to_param, event: :event.to_param}
      expect(response).to render_template :update
    end
  end
# TODO check render json

end
