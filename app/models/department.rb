class Department < ActiveRecord::Base
  attr_accessible :name

  has_many :provinces
  has_many :municipalities, through: :provinces

  has_many :lands
 
end
