class StatisticsController < ApplicationController
  def index
    @projects = Project.all
  end

  def projects_by_portfolio
    column_chart projects_by_country, library: {
        title: {text: 'Proyectos por ZM', x: -20},
        yAxis: {
            title: {
                text: 'Cantidad'
            }
        },
        xAxis: {
            title: {
                text: 'Zona'
            }
        }
    }
  end
end