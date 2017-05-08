# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

i = 0
dates = ["15 May 2017", "17 June 2017", "July 30 2017", "8 August 2017", "9 September 2017"]
locations = ["The Lisbon VR HQ", "Evolution Hotel", "Some university", "TimeOut Market", "Tokyo, Japan"]
descriptions = ["It's all shooting and stuff, but not real. You think you're there, but you're not. Totally safe.",
               "In Napoli where love is king, when boy meets girl, here's what they say",
               "When a moon hits your eye like a big pizza pie, that's amore",
               "When the world seems to shine like you've had too much wine, that's amore",
               "When the stars make you drool just like a pasta fazool, that's amore"]
start_times = ["9", "10", "11"]
end_times = ["16", "17", "18"]

5.times do
  # 1) Make an event
  event = Event.new(name: "Event no. #{i + 1}",
                    date: dates[i],
                    start_time: start_times.sample,
                    end_time: end_times.sample,
                    location: locations[i],
                    description: descriptions[i],
                    slot_duration_minutes: 20,
                    price_per_slot: 15)
  event.max_bookings = ((event.end_time - event.start_time) / 60) / event.slot_duration_minutes
  event.save

  # 2) Make all the slots for that event
  slot_start_time = event.start_time
  # event_slot_duration will be added to slot_start_time to set each slot's start_time
  # -- it's "* 60" because times are updated in seconds
  event_slot_duration = event.slot_duration_minutes * 60
  event.max_bookings.times do
    Slot.create(event: event, start_time: slot_start_time)
    slot_start_time += event_slot_duration
  end

  i += 1
end
