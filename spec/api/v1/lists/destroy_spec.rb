require 'rails_helper'

RSpec.describe "lists#destroy", type: :request do
  context 'basic destroy' do
    let!(:list) { FactoryGirl.create(:list) }

    it 'updates the resource' do
      expect {
        delete "/api/v1/lists/#{list.id}"
      }.to change { List.count }.by(-1)

      expect(response.status).to eq(204)
    end
  end
end
