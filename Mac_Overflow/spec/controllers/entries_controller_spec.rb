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


  describe 'Put#update' do
    before :each do
      @entry = create(:entry, title: "sadgaweg", content: "asdfasdga")
    end

    context 'with valid attributes' do
      it 'updates the attributes' do
        put :update, id: @entry, entry: attributes_for(:entry, title: "hello")
        @entry.reload
        expect(@entry.title).to eq("hello")
      end
    end

    context 'with invalid attributes' do
      it "does not update attributes" do
        put :update, id: @entry, entry: attributes_for(:entry, title: nil)
        @entry.reload
        expect(@entry.title).to_not eq(nil)
      end
    end

  end

end

