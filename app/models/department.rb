class Department < ActiveRecord::Base
  has_many :employees, :dependent => :destroy
  # accepts_nested_attributes_for :employees#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  # nested model stuff TODO 
end
