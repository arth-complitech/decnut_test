class AssignmentsController < ApplicationController
	def assign_user
		@users=User.all.where(:type=>["LocalUser","LocalAdmin"])
		@pathway=Pathway.find(params[:pathway_id])
		@assignment=@pathway.assignments.build
	end
	def create_assignment
	 @assignment=@pathway.assignment.build(params[:user_id])
	 respond_to do |format|
      	if @assignment.save
        	format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
     	end
     end
	end
end