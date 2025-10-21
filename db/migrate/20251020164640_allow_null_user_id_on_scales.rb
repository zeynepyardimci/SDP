class AllowNullUserIdOnScales < ActiveRecord::Migration[8.0] 
  def change
    # scales tablosundaki user_id kolonunu, null değerlere izin verecek şekilde değiştir.
    change_column_null :scales, :user_id, true
  end
end