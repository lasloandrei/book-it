class WelcomeController < ApplicationController
  def index
    render json: User.all
  end

  # this is just a mock method to help you with ContactsController.
  # You might want to research *find* as well.
  #
  # Remember to read about routes and controller actions
  def foo
    render json: User.find(params[:id])
  end
end
