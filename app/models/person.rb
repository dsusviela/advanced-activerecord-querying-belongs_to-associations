class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.in_region(region)
    Person.joins(:location).merge(Location.in_region(region))
  end

  def self.alphabetically_by_region_and_location
    Person.joins(location: [:region]).order('regions.name', 'locations.name', 'people.name')
  end
end
