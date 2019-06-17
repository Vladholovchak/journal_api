# spec/requests/groups_spec.rb
require 'rails_helper'

RSpec.describe 'Groups API', type: :request do
  # initialize test data
  let!(:groups) { create_list(:group, 10) }
  let(:group_id) { groups.first.id }

  # Test suite for GET /groups
  describe 'GET /groups' do
    # make HTTP get request before each example
    before { get '/groups' }

    it 'returns groups' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /groups/:id
  describe 'GET /groups/:id' do
    before { get "/groups/#{group_id}" }

    context 'when the record exists' do
      it 'returns the group' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(group_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:group_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Group/)
      end
    end
  end

  # Test suite for POST /groups
  describe 'POST /groups' do
    # valid payload
    let(:valid_attributes) { { leader: 'Ivan Ivanov', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/groups', params: valid_attributes }

      it 'creates a group' do
        expect(json['leader']).to eq('Ivan Ivanov')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/groups', params: { leader: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /groups/:id
  describe 'PUT /groups/:id' do
    let(:valid_attributes) { { leader: 'Ivan' } }

    context 'when the record exists' do
      before { put "/groups/#{group_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /groups/:id
  describe 'DELETE /groups/:id' do
    before { delete "/groups/#{group_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end