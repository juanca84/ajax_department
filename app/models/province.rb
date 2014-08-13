class Province < ActiveRecord::Base
  attr_accessible :name, :department_id
  belongs_to :department

  has_many :municipalities

   scope :by_department_name, lambda { |d| d.present? ? joins(:department).where('departments.name = ?', UnicodeUtils.upcase(d)) : [] }
end
