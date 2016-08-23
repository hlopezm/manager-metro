class RemoveDeliveryDateContactRequestedAmounStatusyFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :delivery_date, :datetime
    remove_column :projects, :contact, :string
    remove_column :projects, :requested_amount, :float
    remove_column :projects, :status, :string
  end
end
