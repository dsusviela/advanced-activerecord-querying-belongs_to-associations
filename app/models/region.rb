class Region < ActiveRecord::Base
  has_many :locations

  def self.in_region(region_name)
    where(name: region_name)
  end
end
