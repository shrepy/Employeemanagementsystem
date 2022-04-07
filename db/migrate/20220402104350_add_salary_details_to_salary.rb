class AddSalaryDetailsToSalary < ActiveRecord::Migration[6.1]
  def change
    add_column :salaries, :leaves, :integer
    add_column :salaries, :earnings, :integer
    add_column :salaries, :deductions, :integer
    add_column :salaries, :total_working_days, :integer
    remove_column :salaries, :total, :integer
  end
end
