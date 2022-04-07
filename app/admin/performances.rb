ActiveAdmin.register Performance do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :points, :month, :from, :to, :employee_id
  #
  # or
  #
  permit_params do
    permitted = [:points, :month, :from, :to, :employee_id]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end


  index do
    id_column
    column 'Employee', :employee.name
    column :points
    column :month
    actions
  end

  permit_params :points, :month, :from, :to, :employee_id

  form do |f|
    f.inputs do   
      f.input :employee.name
      f.input :points
      f.input :month
      
    end
    
    f.actions
  end
  
end
