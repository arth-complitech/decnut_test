class UsersController < ApplicationController

before_action :check_user, only: [:index]

 def index
    @users = User.users_from_same_group(current_user).includes(:department)
 end


 private
 def check_user
        unless current_user.content_admin? or current_user.local_admin?
          redirect_to root_path, notice: "Unauthorised access"
        end
    end
end