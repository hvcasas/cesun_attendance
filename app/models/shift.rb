class Shift < ActiveRecord::Base
  belongs_to :assigment
  validates :description, :presence => true,
                          :length => { :minimum => 5, :maximum =>25 },
                          :uniqueness => true
end
