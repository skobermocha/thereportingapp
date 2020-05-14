class Lot < ApplicationRecord
  belongs_to :project
  
  def sitename
  	"#{self.lot} - #{self.address}"
  end
end
