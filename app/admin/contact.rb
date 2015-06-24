ActiveAdmin.register Contact do
  permit_params :first_name, :last_name, :phone_number, :email
 
 	form do |f|
	    f.inputs "Contact Details" do
	      f.input :first_name
	      f.input :last_name
	      f.input :phone_number
	      f.input :email
	    end
	end

end