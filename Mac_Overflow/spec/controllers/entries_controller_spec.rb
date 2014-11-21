require 'rails_helper'

describe EntriesController, type: :controller do
  context '#index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end
  end

end
