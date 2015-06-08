#encoding: utf-8
module EmployeesHelper
  
  # alle Helper stehen allen views zur Verfügung  
  def back_to_list
    link_to "Zurück zur Liste", employees_path
    #statt employees_path auch :back moeglich
  end
  
end
