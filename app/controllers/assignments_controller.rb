class AssignmentsController < ApplicationController

	def assign_user
		@users=User.all.where(:type=>["LocalUser","LocalAdmin"])
		@pathway=Pathway.find(params[:pathway_id])
		@assignment=@pathway.assignments.build
	end

	def create_assignment
	 @pathway=Pathway.find(params[:pathway_id])
	 user = User.find(params[:assignment][:user_id])
	 @assignment = @pathway.assignments.build(user_id: params[:assignment][:user_id], creator_user_id: params[:creator_user_id])
	  respond_to do |format|
      unless Assignment.where(:pathway_id => params[:pathway_id], :user_id => params[:assignment][:user_id], :status => nil).present?
      	if @assignment.save
        	format.html { redirect_to assignments_url, notice: 'Assignment was successfully created.' }
        end
      else
        format.html { redirect_to assign_user_path(params[:pathway_id]), notice: 'This pathway is already assigned to ' << user.email }
     	end
     end
	end

	def update_assignments
		@assignment = Assignment.find(params[:assignment_id])
		if @assignment.status == nil
			if @assignment.update_attributes(status:"completed")
				# assignment_steps = AssignmentsStep.where(assignment_id: params[:assignment_id])
				# assignment_steps.destroy_all
				# @assignment.destroy
				redirect_to root_path
			else
				redirect_to step_index_path
			end
		end
	end

	def index
     if current_user.content_admin? or current_user.local_admin?
      puts "========content/local admin========"
      @department_ids = Group.find(current_user.group_id).departments.pluck(:id)
      @users = User.where(:department_id => @department_ids)
      @user_ids = @users.pluck(:id)
      @assignments = Assignment.all.where(:user_id => @user_ids)
    else  
      puts "==============superadmin"
      @assignments = Assignment.all
    end
		#@pathway_id = Assignment.all.where(:pathway_id => params[:pathway_id],:user_id => current_user.id)
		#@pathway_ids = @assignments.pluck(:pathway_id)
	end

	def destroy
		@assignment = Assignment.find(params[:id])
    	@assignment.destroy
    	respond_to do |format|
      		format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

  	def show
  		@assignment = Assignment.find(params[:id])
  	end

  	def edit
  		@assignment = Assignment.find(params[:id])
      @users=User.all.where(:type=>["LocalUser","LocalAdmin"])
  	end

  	def update
      @assignment = Assignment.find(params[:id])
    	respond_to do |format|
      	if @assignment.update(assignment_params)
        	format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        	format.json { render :show, status: :ok, location: @assignment }
      	else
        	format.html { render :edit }
        	format.json { render json: @assignment.errors, status: :unprocessable_entity }
      	end
    	end
  	end

  	private

  	def assignment_params
  		params.require(:assignment).permit(:pathway_id, :status, :memo, :user_id, :creator_user_id)
  	end

end