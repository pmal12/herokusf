class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    admin = Admin.find_by(params[:username])
    if admin and admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid username/password combination"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to store_url, alert: "Logged out"
  end
end