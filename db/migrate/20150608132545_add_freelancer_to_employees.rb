class AddFreelancerToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :freelancer, :boolean
  end
end
