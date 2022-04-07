ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :father_name, :mother_name, :age, :phone_number, :address, :trainer_id, :destination, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :image, :leave_count, :department, :bank_name, :account_number, :pan_card_number, :aadhar_card_number, :salary, :primary_skill
  #
  # or
  #
  actions :index, :show, :edit, :new, :create, :update

  permit_params do
     permitted = [:name, :father_name, :mother_name, :age, :phone_number, :address, :trainer_id, :destination, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :image, :leave_count, :department, :bank_name, :account_number, :pan_card_number, :aadhar_card_number, :salary, :primary_skill]
     permitted << :other if params[:action] == 'create' && current_admin_user
     permitted
  end

  index do
    id_column
    column :name
    column :father_name
    column :mother_name
    column :age
    column :phone_number
    column :address
    column :trainer_id
    column :destination

    column :actions do |action|
      link_to 'View', admin_employee_path(action.id)
    end
    column :actions do |action|
      link_to 'Edit', edit_admin_employee_path(action.id)
    end
  end


 
  show do
    attributes_table do
      row :id
      row :name
      row :father_name
      row :mother_name
      row :age
      row :phone_number
      row :address
      row :trainer_id
      row :destination
      row :email
      row :image
      row :leave_count
      row :department
      row :bank_name
      row :account_number
      row :pan_card_number
      row :aadhar_card_number
      row :salary
      row :primary_skill
      
    end
    active_admin_comments
  end

   permit_params :name, :father_name, :mother_name, :age, :phone_number, :address, :trainer_id, :destination, :email, :encrypted_password, :reset_password_token, :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :image, :leave_count, :department, :bank_name, :account_number, :pan_card_number, :aadhar_card_number, :salary, :primary_skill
   form do |f|
     f.inputs do   
       f.input :name
       f.input :father_name
       f.input :mother_name
       f.input :age
       f.input :phone_number
       f.input :address
       f.input :trainer_id
       f.input :destination
       f.input :email
       f.input :image
       f.input :department
       f.input :bank_name
       f.input :account_number
       f.input :pan_card_number
       f.input :aadhar_card_number
       f.input :salary, input_html: { max: 50000, required: true }
       f.input :primary_skill
       f.input :password
       f.input :password_confirmation
    end
     f.actions
   end
end
