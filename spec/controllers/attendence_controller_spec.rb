# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttendencesController, type: :controller do
  fixtures :all

  let!(:designation) { FactoryBot.create(:designation) }
  let!(:employee) { FactoryBot.create(:employee, role_id: roles(:role_one).id, designation_id: designation.id) }
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

      it 'redirect to root path if Attendence is not exist' do
        get :show, params: { id: '' }
        assert_response(302)
      end
    end
  end

  describe 'edit' do
    context 'Employee can not edit Attendence' do
      let!(:employee_one) { FactoryBot.create(:employee, role_id: roles(:role_two).id, designation_id: designation.id) }
      let!(:attendence_one) { FactoryBot.create(:attendence, employee_id: employee_one.id) }

      it 'hr can edit employee attendences' do
        get :edit, params: { id: attendence.id }
        assert_response(200)
      end

      it 'redirect to root path  when current employee role is employee' do
        get :edit, params: { id: attendence.id }
        assert_response(200)
      end

      it 'redirect to root path if Attendence is not exist' do
        get :edit, params: { id: '' }
        assert_response(302)
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
      get :search, params: { start_date: Time.now.to_date, end_date: Time.now.to_date + 2.days }, xhr: true
      expect(assigns(:attendences)).to eq([attendence])
    end
  end
end
