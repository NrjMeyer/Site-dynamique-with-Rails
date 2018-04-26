class UserController < ApplicationController
  def new
  end

  def create
    if params['username'] != ""
      if !params['username'].match(/\s/)
        user = User.create(username: params['username'].downcase, bio: params['bio'])
        user.save
        validation = user.valid?
        if validation
          redirect_to get_user_path(user.id)
        else
          redirect_to error_insert_path
        end
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
    end
  end

  def show
    if params['id_user'].to_i != 0
      @user = User.find(params['id_user'].to_i)
    elsif params['id_user'].to_s != ""
      @user = User.find_by(username: params['id_user'].to_s.capitalize)
    else
      redirect_to home_path
    end
  end

  def error
  end
end
