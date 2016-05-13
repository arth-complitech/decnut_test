class PathwaysController < ApplicationController
  before_action :set_pathway, only: [:show, :edit, :update, :destroy,:sort]
  before_action :check_user , only: [:new, :create, :show, :index, :edit, :update, :destroy]
  # GET /pathways
  # GET /pathways.json
  def index
    @pathways = Pathway.all
  end


  # GET /pathways/1
  # GET /pathways/1.json
  def show
  end

  # GET /pathways/new
  def new
    @pathway = Pathway.new
    @pathway.steps.build
    @pathway.pathways_steps.build
  end

  # GET /pathways/1/edit
  def edit
    @steps = @pathway.steps
  end

  # POST /pathways
  # POST /pathways.json
  def create
    @pathway = Pathway.new(pathway_params)
    @pathway.group_id=current_user.department.group.id
    respond_to do |format|
      if @pathway.save
        @pathway.pathways_steps.each_with_index do |pathways_step,index|
          pathways_step.display_order=index+1
          pathways_step.save
        end
        format.html { redirect_to @pathway, notice: 'Pathway was successfully created.' }
        format.json { render :show, status: :created, location: @pathway }
      else
        format.html { render :new }
        format.json { render json: @pathway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pathways/1
  # PATCH/PUT /pathways/1.json
  def update
    respond_to do |format|
      if @pathway.update(pathway_params)
        @pathway
        format.html { redirect_to @pathway, notice: 'Pathway was successfully updated.' }
        format.json { render :show, status: :ok, location: @pathway }
      else
        format.html { render :edit }
        format.json { render json: @pathway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pathways/1
  # DELETE /pathways/1.json
  def destroy
    @pathway.destroy
    respond_to do |format|
      format.html { redirect_to pathways_url, notice: 'Pathway was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def homepage
    if current_user.content_admin?
      redirect_to groups_path
    end
    @pathway_ids = current_user.assignments.pluck(:pathway_id) 
    @pathways = Pathway.find(@pathway_ids)
    @group = current_user.department.group.id
    @assignments = Assignment.all.pluck(:pathway_id).uniq
    @pathway_all = Pathway.all.where(:group_id => @group).pluck(:id)
    @library_pathway_ids = @pathway_all - @assignments
    @library_pathways = Pathway.find(@library_pathway_ids)
    #@references = Pathway.all.where(:pathway_type => "Reference")
    #@completed_pathway_ids = AssignmentsStep.find_by(:assignment_id => @assignment).assignment.pathway_id
  end


  def duplicate_pathway
    @pathway=Pathway.find(params[:pathway_id])
    duplicated_pathway = @pathway.deep_clone include: :steps
    if duplicated_pathway.save
      redirect_to edit_pathway_path(duplicated_pathway), notice: "Duplicate Pathway Created."
    else
    end
  end


  def sort
    params[:arrange].each_with_index do |id, index|
      @pathway.pathways_steps.where(id: id).update_all(display_order: index + 1)
    end
    #render nothing: true
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pathway
      @pathway = Pathway.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pathway_params
      params.require(:pathway).permit(:title, :active, :memo ,:steps_attributes => [:id,:_destroy,:title, :subtitle, :body, :parent_step_id, :url_link, :active, :memo,:url_to_youtube,:pathways_steps_attributes => [:id,:_destroy,:display_order]])
    end

    def check_user
      # raise current_user.content_admin?.inspect
      # unless current_user.content_admin? and current_user.local_admin?
      #   redirect_to root_path, notice: "Unauthorised access"
      # end
    end
end
