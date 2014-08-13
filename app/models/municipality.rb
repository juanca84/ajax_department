class Municipality < ActiveRecord::Base
	attr_accessible :name, :province_id
  	belongs_to :province  

  	has_many :lands

  	scope :by_department_name, lambda { |d| d.present? ? Community.joins(province: :department).where('departments.name = ?', UnicodeUtils.upcase(d)) : [] }
end
