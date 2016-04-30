class UsersController < ApplicationController

	before_action :check_user, only: [:index]

 def index
    @users = User.all
 end

 private
 def check_user
        unless current_user.content_admin?
          redirect_to root_path, notice: "Unauthorised access"
        end
    end
end