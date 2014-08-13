class Land < ActiveRecord::Base
  attr_accessible :unit, :department_id, :municipality_id, :register_id
  
  belongs_to :department
  belongs_to :municipality  
  belongs_to :register

end
