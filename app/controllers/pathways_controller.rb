class PathwaysController < ApplicationController
  before_action :set_pathway, only: [:show, :edit, :update, :destroy]
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
  end

  # GET /pathways/1/edit
  def edit
  end

  # POST /pathways
  # POST /pathways.json
  def create
    @pathway = Pathway.new(pathway_params)

    respond_to do |format|
      if @pathway.save
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
    @pathway_ids = current_user.assignments.pluck(:pathway_id) 
    @pathways = Pathway.find(@pathway_ids)
    @references = Pathway.all.where(:pathway_type => "Reference")
    #@completed_pathway_ids = AssignmentsStep.find_by(:assignment_id => @assignment).assignment.pathway_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pathway
      @pathway = Pathway.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pathway_params
      params.require(:pathway).permit(:title, :active, :memo, :user_id , :pathway_type,:steps_attributes => [:id,:_destroy,:title, :subtitle, :body, :parent_step_id, :url_link, :active, :memo])
    end

    def check_user
      # raise current_user.content_admin?.inspect
      # unless current_user.content_admin? and current_user.local_admin?
      #   redirect_to root_path, notice: "Unauthorised access"
      # end
    end
end
