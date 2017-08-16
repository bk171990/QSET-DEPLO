class AddReferenceToMonthlyPayslip < ActiveRecord::Migration
  def change
    add_reference :monthly_payslips, :school, index: true, foreign_key: true
  end
end
