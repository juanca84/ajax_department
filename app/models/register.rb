class Register < ActiveRecord::Base
  attr_accessible :name, :lands_attributes

  validates_presence_of :name, :lands  

  has_many :lands, dependent: :destroy

  accepts_nested_attributes_for :lands, reject_if: lambda { |a| a[:department_id].blank? && a[:municipality_id].blank? }, allow_destroy: true
end
