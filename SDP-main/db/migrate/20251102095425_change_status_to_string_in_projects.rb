class ChangeStatusToStringInProjects < ActiveRecord::Migration[8.0]
  def change
    change_column :projects, :status, :string
  end
end
