class SessionController < ApplicationController

  def new

  end

  def create
    username = params[:user][:username].downcase
    if username["@geemailer.com"].nil?
      username += "@geemailer.com"
    end

    @user = User.find_by_credentials(username, params[:user][:password])
    if @user
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username/password"]
      render :new
    end
  end

  def destroy
    sign_out
    render :new
  end
  
end
