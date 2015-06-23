class ContactsController < ApplicationController
  def index
 	render json: Contact.all
  end

  def show

  	render json: Contact.find(1)
  
  end

end
