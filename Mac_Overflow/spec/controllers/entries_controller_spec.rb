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
      @entry = Entry.create
    end

    it "assigns @entry to entry" do
      get :show, id: @entry
      expect(assigns(:entry)).to eq @entry
    end

    it "is successful" do
      get :show, id: @entry
      expect(response).to be_successful
    end
  end

  # context '#create' do
  #   it 'with valid attributes' do
  #     expect {
  #       post :create#, entry: attributes_for(:entry)
  #       expect(response).to be_redirect
  #     }.to change { Entry.count }.by(1)
  #   end

  # end

end
