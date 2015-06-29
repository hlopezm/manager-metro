class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [ :new ,:edit, :update, :create, :destroy ]
  helper_method :calcular_total

  respond_to :html

  def index
    @portfolios = Portfolio.all
    respond_with(@portfolios)
  end

  def show
    @projects = @portfolio.projects.group_by { |project| project.category.name }
  end

  def new
    @portfolio = Portfolio.new
    respond_with(@portfolio)
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.save
    respond_with(@portfolio)
  end

  def update
    @portfolio.update(portfolio_params)
    respond_with(@portfolio)
  end

  def destroy
    @portfolio.destroy
    respond_with(@portfolio)
  end

  def calcular_total(projects)
    100
  end

  private
    def set_portfolio
      @portfolio = Portfolio.includes(:projects).find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:name)
    end
end
