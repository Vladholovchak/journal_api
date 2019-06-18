require 'rails_helper'

RSpec.describe 'Students API' do
  # Initialize the test data
  let!(:group) { create(:group) }
  let!(:students) { create_list(:student, 20, group_id: group.id) }
  let(:group_id) { group.id }
  let(:id) { students.first.id }

  # Test suite for GET /groups/:group_id/students
  describe 'GET /groups/:group_id/students' do
    before { get "/groups/#{group_id}/students" }

    context 'when todo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all group students' do
        expect(json.size).to eq(20)
      end
    end

    context 'when group does not exist' do
      let(:group_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Group/)
      end
    end
  end

  # Test suite for GET /gr/:group_id/students/:id
  describe 'GET /groups/:group_id/students/:id' do
    before { get "/groups/#{group_id}/students/#{id}" }

    context 'when group student exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the student' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when group student does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Student/)
      end
    end
  end

  # Test suite for PUT /groups/:group_id/students
  describe 'POST /groups/:group_id/students' do
    let(:valid_attributes) { { name: 'Vlad' } }

    context 'when request attributes are valid' do
      before { post "/groups/#{group_id}/students", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/groups/#{group_id}/students", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /groups/:group_id/students/:id
  describe 'PUT /groups/:group_id/students/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/groups/#{group_id}/students/#{id}", params: valid_attributes }

    context 'when student exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the student' do
        updated_student = Student.find(id)
        expect(updated_student.name).to match(/Mozart/)
      end
    end

    context 'when the student does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Student/)
      end
    end
  end

  # Test suite for DELETE /groups/:id
  describe 'DELETE /groups/:id' do
    before { delete "/groups/#{group_id}/students/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end