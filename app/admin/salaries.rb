ActiveAdmin.register Salary do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :salary, :month, :employee_id, :leaves, :earnings, :deductions, :total_working_days
  #
  # or
  #
  permit_params do
     permitted = [:salary, :month, :employee_id, :leaves, :earnings, :deductions, :total_working_days]
     permitted << :other if params[:action] == 'create' && current_admin_user
     permitted
  end
  

  index do
    id_column
    column 'Employee', :employee.name
    column :salary
    column :month
    column :leaves
    actions
  end
  permit_params :salary, :month, :employee_id, :leaves, :earnings, :deductions, :total_working_days

  form do |f|
    f.inputs do   
      f.input :employee.name
      f.input :salary
      f.input :month
      f.input :leaves
    end
    
    f.actions
  end
  
end