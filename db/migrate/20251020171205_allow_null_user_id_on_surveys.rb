class AllowNullUserIdOnSurveys < ActiveRecord::Migration[8.0]
  def change
    change_column_null :surveys, :user_id, true
  end
end