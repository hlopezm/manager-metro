class AddMillarToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :millar, :decimal
  end
end
