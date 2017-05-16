# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

i = 0
names = ["Lorem ipsum dolor sit amet", "Consectetur adipisicing elit", "Sed do eiusmod tempor incididunt", "Labore et dolore magna aliqua", "Ut enim ad minim veniam"]
dates = ["15 May 2017", "17 June 2017", "July 30 2017", "8 August 2017", "9 September 2017"]
locations = ["The Lisbon VR HQ", "Evolution Hotel", "Some university", "TimeOut Market", "Tokyo, Japan"]
descriptions = ["Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
start_times = ["9", "10", "11"]
end_times = ["16", "17", "18"]
number_of_players = [2, 2, 4, 2, 4]

5.times do
  # 1) Make an event
  event = Event.new(name: names[i],
                    date: dates[i],
                    start_time: start_times.sample,
                    end_time: end_times.sample,
                    location: locations[i],
                    description: descriptions[i],
                    slot_duration_minutes: 20,
                    number_of_players: number_of_players[i],
                    price_per_slot: 15)
  event.max_bookings = ((event.end_time - event.start_time) / 60) / event.slot_duration_minutes
  event.save

  # 2) Make all the slots for that event
  event.number_of_players.times do
    slot_start_time = event.start_time
    # event_slot_duration will be added to slot_start_time to set each slot's start_time
    # -- it's "* 60" because times are updated in seconds
    event_slot_duration = event.slot_duration_minutes * 60
    event.max_bookings.times do
      Slot.create(event: event, start_time: slot_start_time)
      slot_start_time += event_slot_duration
    end
  end

  i += 1
end
