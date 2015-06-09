class Employee < ActiveRecord::Base
  belongs_to :department # ein Employee gehoert zu einem Department
  # Konstante, single_point_of_trust, dry
  # hier muss I18n.t statt t genutzt werden!!
  TITLES = [I18n.t("text.woman"), I18n.t("text.woman_doc"), I18n.t("text.man"), I18n.t("text.man_doc")]
end
