
class SessionController < ApplicationController
  def new
  end


  def create
    u = User.find_by_username(params[:username])
    if u
      if u.can_login?
        if u.password == params[:password]
          session[:user_id] = u.id
          redirect_to welcome_path
        else
          u.failed_login_attempts += 1
          u.last_login_attempt = Time.now
          u.locked = true if u.failed_login_attempts >= 4
          u.save!
          if u.locked
            flash.now[:message] = "The account is locked due to too many failed login attempts"
            render :action => :new
          else
            flash.now[:message] = "Invalid password. #{4 - u.failed_login_attempts} attempts remaining"
            render :action => :new
          end
        end
      else
          flash.now[:message] = "The account is locked due to too many failed login attempts"
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
