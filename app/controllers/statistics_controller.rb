class StatisticsController < ApplicationController
  def index
    @projects = Project.all
  end
end