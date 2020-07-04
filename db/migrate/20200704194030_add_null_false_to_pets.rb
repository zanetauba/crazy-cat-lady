class AddNullFalseToPets < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pets, :name, false
  end
end
