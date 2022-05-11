# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttendencesController, type: :controller do
  let!(:designation) { FactoryBot.create(:designation) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:employee) { FactoryBot.create(:employee, role_id: role.id, designation_id: designation.id) }
  let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id) }
  before do
    sign_in(employee)
  end
  describe 'index' do
    it 'Get Attendence' do
      get :index
      expect(response.status).to eq(200)
    end

    context 'Show Attendence' do
      it 'renders a successful response when Attendence exist' do
        get :show, params: { id: attendence.id }
        expect(assigns(:attendence)).to eq(attendence)
      end

      it 'render 403 code if Attendence is not exist' do
        get :show, params: { id: '' }
        assert_response(404)
      end
    end
  end

  describe 'edit' do
    context 'Employee can not edit Attendence' do
      let!(:role) { FactoryBot.create(:role, name: 'Employee') }
      let!(:employee_one) { FactoryBot.create(:employee, role_id: role.id, designation_id: designation.id) }
      let!(:attendence_one) { FactoryBot.create(:attendence, employee_id: employee_one.id) }

      it 'render a message when current employee role is employee' do
        get :edit, params: { id: attendence_one.id }
        parse_json = JSON(response.body)
        expect(parse_json['message']).to eq('You Have Not Access :)')
      end

      it 'render 403 code if Attendence is not exist' do
        get :edit, params: { id: '' }
        assert_response(404)
      end
    end

    context 'Hr can edit employee attendences' do
      it 'render a message when current employee role is employee' do
        get :edit, params: { id: attendence.id }
        expect(assigns(:attendence)).to eq(attendence)
      end

      it 'render 403 code if Attendence is not exist' do
        get :edit, params: { id: '' }
        assert_response(404)
      end
    end
  end

  describe 'create' do
    it 'checkin' do
      post :create, params: { employee_id: employee.id }
      expect(response.status).to eq(302)
    end
  end

  describe 'update ' do
    it 'checkout by hr' do
      patch :update, params: { id: attendence.id, checkout_time: Time.now }
      expect(response.status).to eq(302)
    end
  end

  describe 'update attendence' do
    let!(:attendence) { FactoryBot.create(:attendence, employee_id: employee.id, checkin_time: Time.now) }
    it 'checkout by employee' do
      patch :update_attendence
      expect(response.status).to eq(302)
    end
  end

  describe 'search' do
    it 'search by start date and end date' do
      get :search, params: { start_date: '2022-05-11', end_date: '2022-05-15' }, xhr: true
      expect(assigns(:attendences)).to eq([attendence])
    end
  end
end
