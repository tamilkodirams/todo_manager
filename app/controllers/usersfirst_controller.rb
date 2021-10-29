class UsersFirstController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: UsersFirst.all.map { |usersfirst| usersfirst.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = UsersFirst.create(
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
    users = UsersFirst.find(id)
    users.save!
    render plain: " updated users password to #{password}"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = UsersFirst.find_by(email_id: email, password: password)
    render plain: user.present?
  end

  def show
    id = params[:id]
    user = UsersFirst.find(id)
    render plain: user.to_pleasant_string
  end
end
