class Addcustomer < ApplicationRecord
 #  validates_presence_of :firstname, :lastname, :homeaddress, :birthday 
 validates :name, presence: true
 validates :lastname, presence: true
 validates :homeaddress, presence: true
 validates :dateofbirth, presence: true
end
