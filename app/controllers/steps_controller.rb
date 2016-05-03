class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  # GET /steps
  # GET /steps.json
  def index
    @steps = Step.all
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = Step.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def step_index
    @pathway = Pathway.find(params[:pathway_id])
    @steps = @pathway.steps
    @assignment = current_user.assignments.where(pathway_id: @pathway.id).first
    if @pathway.pathway_type == "Assignable"
      @completed_step_ids = AssignmentsStep.all.where(:assignment_id => @assignment.id).pluck(:step_id) 
      @pathway_steps_count = @pathway.steps.count
      @completed_steps_count = AssignmentsStep.where(:assignment_id => @assignment.id).count
    end  
  end

  def step_show
    @step = Step.find(params[:step_id])
    @pathway = @step.pathway
    @assignment = current_user.assignments.where(pathway_id: @pathway.id).first
    
  end

  def add_assignments_steps
    @step = Step.find(params[:step_id])
    @assignment = @step.assignments_steps.build(assignment_id: params[:assignment_id], step_id: params[:step_id])
    @pathway = @step.pathway
    if @assignment.save
      redirect_to step_index_path(@pathway)
    else
      render step_show_path(@step)
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:pathway_id, :title, :subtitle, :body, :parent_step_id, :url_link, :active, :memo)
    end

end
