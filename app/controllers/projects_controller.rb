class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :initialize_report
  before_action :authenticate_admin!, only: [ :new ,:edit, :update, :create, :destroy ]

  respond_to :html

  def index
    @q = params[:q]
    if @q
      @projects = Project.where("name like ?", "%#{@q}%")
    else
      @projects = Project.all
    end
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Proyecto creado exitosamente.'
     else
       render action: 'new'
    end
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end


  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :price, :image, :category_id, :portfolio_id, :executor_id, :unit_id, :target_set, :contract_number, :authorized_amount, :economy, :start_date, :end_date, :physical_progress, :financial_progress, :extension, :contract_modification, :status_id, :observations, :auth_number, :location, :paid, :payable, :act, :interest, :shcp_start, :shcp_end, :millar)
    end
end
