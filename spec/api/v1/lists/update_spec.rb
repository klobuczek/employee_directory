require 'rails_helper'

RSpec.describe "lists#update", type: :request do
  context 'basic update' do
    let!(:list) { create(:list) }

    let(:payload) do
      {
        data: {
          id: list.id.to_s,
          type: 'lists',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        jsonapi_put "/api/v1/lists/#{list.id}", payload
      }.to change { list.reload.attributes }
      assert_payload(:list, list, json_item)

      # ... assert updates attributes ...
    end
  end
end
