
class SessionController < ApplicationController
  def new
  end


  def create
    u = User.find_by_username(params[:username])
    if u
      if u.password == params[:password]
        session[:user_id] = u.id
        redirect_to welcome_path
      else
        u.failed_login_attempts += 1
        u.save!
        flash.now[:message] = "Invalid password$#{u.failed_login_attempts}"
        render :action => :new
      end
    else
      flash.now[:message] = "Invalid username"
      render :action => :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end
end
