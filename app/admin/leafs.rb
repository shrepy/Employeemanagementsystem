ActiveAdmin.register Leaf do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  
  # or
  #
   permit_params do
     permitted = [:leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days, :reason, :leave_status, :employee_id]
     permitted << :other if params[:action] == 'create' && current_admin_user
     permitted
   end

  index do
      id_column
      column 'Employee', :employee.name
      column :leave_type
      column :from_date
      column :till_date
      column :leave_starts
      column :leave_end
      column :total_days
      column :reason
      actions
  end

  
  permit_params :leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days, :reason, :leave_status, :employee_id

  form do |f|
    f.inputs do   
      f.input :employee.name
      f.input :leave_status,
              as: :select,
              include_blank: false,
              collection: Leaf.leave_statuses

    end
    f.actions
  end
  
end


