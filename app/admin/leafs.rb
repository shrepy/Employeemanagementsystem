ActiveAdmin.register Leaf do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :available_balance, :leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days, :resion, :leave_status, :employee_id
    form do |f|
      f.inputs do
        f.input :leave_status,
                as: :select,
                include_blank: false,
                collection: Leaf.leave_statuses
        
      f.submit
    end
  end
  # or
  #
   permit_params do
     permitted = [:available_balance, :leave_type, :from_date, :till_date, :leave_starts, :leave_end, :total_days, :resion, :leave_status, :employee_id]
     permitted << :other if params[:action] == 'create' && current_user.admin?
     permitted
   end


  #  index do
  #   id_column
  #   column :reference
  #   column('Status') do |resource|
  #     "#{resource.leavestatus} <br/>#{sync_status(resource.wms_sync_status)}".html_safe
  #   end
  #   # column :shipping_method
  #   # column 'Sales Channel', &:store
  #   # column 'Synch Method', &:synch_type
  #   column :created_at
  #   column :updated_at
  #   actions
  # end
  
end
