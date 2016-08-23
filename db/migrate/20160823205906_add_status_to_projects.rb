class AddStatusToProjects < ActiveRecord::Migration[5.0]
  def change
    status = Status.create! title: "No status"
    add_reference :projects, :status, index: true, default: status.id
    add_foreign_key :projects, :statuses
  end
end
