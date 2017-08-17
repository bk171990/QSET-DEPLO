class AddReferenceToMonthlyPayslip < ActiveRecord::Migration
  def change
    add_reference :monthly_payslips, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
