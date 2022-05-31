# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::LeafsController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }
  let!(:leaf) { FactoryBot.create(:leaf, employee_id: employee.id, from_date: Time.now, till_date: Time.now) }
  let(:leaf_one) do
    FactoryBot.create(:leaf, employee_id: employee.id, from_date: Time.now + 1.day, till_date: Time.now + 1.day)
  end

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all leave ' do
      get :index, params: { format: :json }
      response_body = JSON.parse(response.body)
      expect(response_body['data'][0]['id']).to eq(leaf.id)
    end
  end

  describe '#create' do
    context 'apply for leave' do
      let(:valid_leaf) do
        attributes_for(:leaf, employee_id: employee.id, from_date: '2022-06-20', till_date: '2022-06-22')
      end
      let(:invalid_leaf) do
        attributes_for(:leaf, employee_id: employee.id, from_date: '2022-05-20', till_date: '2022-05-22')
      end
      it 'renders a successful response when leave applied' do
        post :create, params: { leaf: valid_leaf }
        expect(Leaf.count).to eq(2)
        response_body = JSON.parse(response.body)
        expect(response.status).to eq(200)
      end

      it 'renders a failed response when leave not created' do
        post :create, params: { leaf: invalid_leaf }
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response.status).to eq(302)
      end
    end
  end

  describe '#update' do
    context 'update leave status' do
      it 'renders a successful response when leave status update' do
        patch :update,
              params: { leaf: { leave_status: 'cancel' }, id: leaf_one.id }
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response_body[:data][:leave_status]).to eq('cancel')
        expect(response.status).to eq(200)
      end

      it 'renders a failed response when leave  status not update' do
        patch :update,
              params: { leaf: { leave_status: 'cancel' }, id: leaf.id }
        response_body = JSON.parse(response.body).deep_symbolize_keys
        expect(response.status).to eq(304)
      end
    end
  end
end
