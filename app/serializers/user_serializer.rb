class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :phone, :location, :finder_radius, :email_confirmed, :country, :number_of_referred_users, :latitude, :longitude, :unique_scans
  has_many :pets
  has_many :devices
  # has_many :scans

  def number_of_referred_users
    User.where(referral_id: self.object.id).count
  end

  def unique_scans
    unique_scans = Array.new()
    Array.new(self.object.scans).map { |i|
      u = unique_scans.find { |j| j.tag_id == i.tag_id }
      if u
        u[:count] += 1
      else
        i[:count] = 1
        unique_scans << i
      end
    }
    unique_scans.sort_by { |k| k[:count] }
    unique_scans
  end
end
