timings = ["07:25","11:00","12:30", "14:30", "18:00", "21:00"]
seatcount = [50, 75, 100, 125, 150]

timings.each do |time|
    Timing.create(time: time )
end

seatcount.each do |seats|
    Seat.create(seat_count: seats)
end