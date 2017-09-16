require 'rails_helper'

RSpec.describe "lists#index", type: :request do
  context 'basic fetch' do
    let!(:list1) { create(:list) }
    let!(:list2) { create(:list) }

    it 'serializes the list correctly' do
      get "/api/v1/lists"

      expect(json_ids(true)).to match_array([list1.id, list2.id])
      assert_payload(:list, list1, json_items[0])
      assert_payload(:list, list2, json_items[1])
    end
  end
end
