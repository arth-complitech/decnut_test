class AssignmentsController < ApplicationController

	def assign_user
		@users=User.all.where(:type=>["LocalUser","LocalAdmin"])
		@pathway=Pathway.find(params[:pathway_id])
		@assignment=@pathway.assignments.build
	end

	def create_assignment
	 @pathway=Pathway.find(params[:pathway_id])
	 user = User.find(params[:assignment][:user_id])
	 @assignment=@pathway.assignments.build(user_id: params[:assignment][:user_id])
	  respond_to do |format|
      	if @assignment.save
        	format.html { redirect_to pathways_url, notice: 'Assignment was successfully created.' }
        else
        	format.html { redirect_to assign_user_path(params[:pathway_id]), notice: 'This pathway is already assigned to ' << user.fullname }
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
				render step_index_path
			end
		end
	end
end