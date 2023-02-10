class ParkSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :address, :name, :description, :hours, :unique_visitors, :icon
  has_many :park_visits

  def hours
    hours = {}
    hours[:sunday] = self.object.hours_sunday
    hours[:monday] = self.object.hours_monday
    hours[:tuesday] = self.object.hours_tuesday
    hours[:wednesday] = self.object.hours_wednesday
    hours[:thursday] = self.object.hours_thursday
    hours[:friday] = self.object.hours_friday
    hours[:saturday] = self.object.hours_saturday
    hours
  end

  def unique_visitors
    unique_visitors = Array.new()
    Array.new(self.object.park_visits).map { |i|
      u = unique_visitors.find { |j| j.pet_id == i.pet_id }
      if u
        u[:count] += 1
      else
        i[:count] = 1
        unique_visitors << i
      end
    }
    unique_visitors.sort_by { |k| k[:count] }
    unique_visitors
  end
end
