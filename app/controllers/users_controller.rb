class UsersController < ApplicationController
  before_action :authenticate!, except: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    if (@user = User.find_by name: submitted_user[:name])
      if @user.authenticate submitted_user[:password]
        session['token'] = @user.session_token
        redirect_to @user
      else
        flash.alert = "username and password didn't match"
        render 'new'
      end
    else
      flash.alert = if Rails.env.production?
                      "username and password didn't match"
                    else
                      'user not found'
                    end
      render 'new' 
    end
  end

  # TODO this route should redirect to #show unless the user is an admin
  def index
    @users = User.all
  end
  
  def show
    @user = current_user
  end
  
  def destroy
    session.delete 'token'
    current_user = nil
    redirect_to root_path
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    ['name', 'password', 'password_confirmation'].each do |prop|
      @user.send "#{prop}=", params[prop] if params[prop]
    end
    if @user.save
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  
  def submitted_user
    @submitted_user ||= (params.required :user).permit :name, :password
  end

end
