class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      status = Status.create! name: "N/A"
      add_reference :projects, :status, index: true, default: status.id
      add_foreign_key :projects, :statuses
    end
  end
end
