class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :check_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]

 def index
  if current_user.local_admin? or current_user.content_admin?
    @users = User.users_from_same_group(current_user).includes(:department)
  else
    @users = User.all
  end
#    @departments = Department.where("group_id = ?", Group.first.id)
 #   @groups = Group.all
 end

 def show
    #@department = Department.find_by("id = ?", params[:user][:department_id])
 end

 def new
 	@departments = Department.where("group_id = ?", Group.first.id)
  @groups = Group.all
  @user=User.new
 end

 def edit
  puts "#{@user.inspect}"
 end

 def create
 	 @user = User.new(user_params)
   puts "helllooooo"
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end
 
 def update
    respond_to do |format|
      puts "helooooooooooo"
      # raise @user.inspect
      #raise "===============#{user_params.inspect}"
      if @user.update_without_password(update_params)
        #puts "helooooooooooo"
        format.html { redirect_to user_path, notice: 'User was successfully updated.' }
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
    def set_user
      @user = User.find(params[:id])
    end

 # Never trust parameters from the scary internet, only allow the white list through.
     def user_params
        params.require(:user).permit(:first_name, :last_name, :title,:mobile_number,:active,:status,:memo,:type,:department_id,:email,:password)
     end

    def update_params
      if @user.type == "SuperAdmin"
        params.require(:super_admin).permit(:first_name, :last_name, :title,:mobile_number,:active,:status,:memo,:type,:department_id,:email,:password)
      elsif @user.type == "LocalAdmin"
        params.require(:local_admin).permit(:first_name, :last_name, :title,:mobile_number,:active,:status,:memo,:type,:department_id,:email,:password)
      elsif @user.type == "ContentAdmin"
        params.require(:content_admin).permit(:first_name, :last_name, :title,:mobile_number,:active,:status,:memo,:type,:department_id,:email,:password)
      else
        params.require(:local_user).permit(:first_name, :last_name, :title,:mobile_number,:active,:status,:memo,:type,:department_id,:email,:password)
      end
    end

    def check_user
        unless current_user.super_admin? or current_user.content_admin? or current_user.local_admin?
          redirect_to root_path, notice: "Unauthorised access"
        end
    end
end