10.times do |i|
  Kitten.create(
    name: "Kitten-#{i}",
    age: i,
    cuteness: i * 10,
    softness: i * 5
  )
end
