class Project < ActiveRecord::Base
  has_many :tasks
  accepts_nested_attributes_for :tasks
  
  has_one :owner, :class_name => 'Author', :conditions => { :owner => true, :admin => true }
  accepts_nested_attributes_for :owner
end
