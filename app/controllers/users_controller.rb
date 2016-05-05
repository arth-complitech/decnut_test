class UsersController < ApplicationController
before_action :set_department, only: [:show, :edit, :update, :destroy]
before_action :check_user, only: [:index]

 def index
    @users = User.users_from_same_group(current_user).includes(:department)
 end

 def show
 end

 def new
 	@user=User.new
 end

 def edit
 end

 def create
 	 @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end
 
 def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
 end

 private
 # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :title,:mobile_number,:active,:status,:memo,:type,:department_id,:email,:password)
    end

 	def check_user
        unless current_user.content_admin? or current_user.local_admin?
          redirect_to root_path, notice: "Unauthorised access"
        end
    end
end