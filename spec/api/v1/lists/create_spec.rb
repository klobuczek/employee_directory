require 'rails_helper'

RSpec.describe "lists#create", type: :request do
  context 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'lists',
          attributes: {
            body: 'body'
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        jsonapi_post "/api/v1/lists", payload
      }.to change { List.count }.by(1)
      list = List.last

      assert_payload(:list, list, json_item)
    end
  end
end
