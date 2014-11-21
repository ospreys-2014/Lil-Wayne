require 'rails_helper'

describe EntriesController, type: :controller do
  context '#index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end

    it "assigns Entry.all to @entries" do
      get :index
      expect(assigns(:entries)).to eq Entry.all
    end
  end

  context '#show' do
    before :each do
      @entry = Entry.new
    end

  end

end
