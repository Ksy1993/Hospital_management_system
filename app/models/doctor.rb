class Doctor < ApplicationRecord
  	belongs_to :department
	has_many :appointments
	has_many :patients, :through => :appointments
	validates :name, presence: true
	validates :contact_no, numericality: true, length: { is: 10, message: "range should be 10"}
	validates :salary, numericality: true
    
    before_create :name_norm

    def name_norm
     	self.name = "Dr. " + name.titleize 
    end
end
