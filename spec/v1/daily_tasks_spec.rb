# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::DailyTasksController, type: :controller do
  let(:role) { FactoryBot.create(:role) }
  let(:designation) { FactoryBot.create(:designation) }
  let(:employee) { FactoryBot.create(:employee, designation_id: designation.id, role_id: role.id) }
  let!(:daily_task) { FactoryBot.create(:daily_task, employee_id: employee.id) }

  before do
    sign_in(employee)
  end

  describe '#index' do
    it 'show all DailyTasks ' do
      get :index
      expect(assigns(:daily_task_data)).to eq([daily_task])
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    before do
      get :show, params: { id: daily_task.id }
    end

    it 'show the DailyTasks details' do
      expect(assigns(:daily_task_data)).to eq(daily_task)
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    it 'created successfully' do
      post :create, params: { daily_task: { employee_id: employee.id, description: 'xyz' } }
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it 'update' do
      put :update, params: { daily_task: { description: 'i am working on EMS' }, id: daily_task.id }
      expect(assigns(:daily_task_data)).to eq(daily_task)
      expect(response.status).to eq(200)
    end

    it 'render 404 when daily task not exit' do
      put :update, params: { daily_task: { description: 'i am working on EMS' }, id: '' }
      expect(response.status).to eq(404)
    end
  end
end
