class AllowNullUserIdOnProjects < ActiveRecord::Migration[8.0] # veya senin versiyonun
  def change
    # projects tablosundaki user_id kolonunu, null değerlere izin verecek şekilde değiştir.
    change_column_null :projects, :user_id, true
  end
end