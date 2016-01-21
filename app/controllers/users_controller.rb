class UsersController < ApplicationController

  def new

  end


  def create
    email_address = user_params[:username].downcase
    if email_address["@geemailer.com"].nil?
      email_address += "@geemailer.com"
    end
    attrs = {name: user_params[:name], username: email_address, password: user_params[:password]}
    @user = User.new(attrs)
    if @user.save
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
