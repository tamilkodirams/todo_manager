class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Users.all.map { |users| users.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = Users.create(
      user_name: name,
      email_id: email,
      password: password,
    )
    response_text = "Hey your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    password = params[:password]
    users = Users.find(id)
    users.save!
    render plain: " updated users password to #{password}"
  end

  def login
    email = params[:email]
    password = params[:password]
    valid = Users.find_by(email_id: email, password: password)
    if valid
      render plain: "True"
    else
      render plain: "False"
    end
  end

  def show
    id = params[:id]
    user = Users.find(id)
    render plain: user.to_pleasant_string
  end
end
