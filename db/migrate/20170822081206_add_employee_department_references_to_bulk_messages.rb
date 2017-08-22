class AddEmployeeDepartmentReferencesToBulkMessages < ActiveRecord::Migration
  def change
    add_reference :bulk_messages, :employee_department, index: true, foreign_key: true
  end
end
