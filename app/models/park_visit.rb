require 'net/http'
require 'uri'

class ParkVisit < ApplicationRecord
  belongs_to :pet

  def self.notify_owners
    @activeParkVisits = ParkVisit.where(is_active: true)
    @activeParkVisits.each do |visit|
      if (Time.current - visit.time_in) > 2.hours
        pet = Pet.find(visit.pet_id)
        device = Device.find_by(user_id: pet.user_id)
        title = "Still Playing?"
        body = "Your pet has been checked in at the park for over 2 hours."
        notifData = {
          notificationType: "PARK_TIMEOUT",
          parkVisitId: visit.id,
          petId: pet.id
        }

        uri = URI.parse('https://exp.host/--/api/v2/push/send')

        request = Net::HTTP::Post.new(uri)
        request['Accept'] = 'application/json'
        request['Content-Type'] = 'application/json'
        
        request.body = {
          to: device.token,
          title: title,
          body: body,
          data: notifData
        }.to_json

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

      end
    end
  end

  def self.test_notify_owners
    title = "Still Playing?"
    body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore."
    notifData = {
      notificationType: "PARK_TIMEOUT",
      parkVisitId: 1,
      petId: 2
    }

    uri = URI.parse('https://exp.host/--/api/v2/push/send')

    request = Net::HTTP::Post.new(uri)
    request['Accept'] = 'application/json'
    request['Content-Type'] = 'application/json'
    
    request.body = {
      to: "ExponentPushToken[7Njq_KCVUhYLxc0U7DR8p-]",
      title: title,
      body: body,
      data: notifData
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
  end

end
