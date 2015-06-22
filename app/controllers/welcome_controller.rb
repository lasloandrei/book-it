class WelcomeController < ApplicationController
  def index
    render json: {}
  end

  # this is just a mock method to help you with ContactsController.
  # You might want to research *find* as well.
  #
  # Remember to read about routes and controller actions
  def foo
    render json: Contact.all
  end
end
