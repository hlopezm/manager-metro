class AddExtrasToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :paid, :decimal
    add_column :projects, :payable, :decimal
    add_column :projects, :act, :string
    add_column :projects, :interest, :decimal
    add_column :projects, :shcp_start, :datetime
    add_column :projects, :shcp_end, :datetime
  end
end
