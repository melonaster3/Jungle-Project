class SessionsController < ApplicationController
    def new
    end
  
    def create
  
       if user = User.authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        flash.alert = 'Successfully logged in'
        redirect_to '/'
      else
        redirect_to '/login', notice: 'User was not found'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to '/login', notice: 'Logged out'
    end
  end
  