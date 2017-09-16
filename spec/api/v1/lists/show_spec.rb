require 'rails_helper'

RSpec.describe "lists#show", type: :request do
  context 'basic fetch' do
    let!(:list) { create(:list) }

    it 'serializes the resource correctly' do
      get "/api/v1/lists/#{list.id}"

      assert_payload(:list, list, json_item)
    end
  end
end
