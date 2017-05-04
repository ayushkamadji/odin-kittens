json.array!(@kittens) do |kitten|
  puts self.class
  json.extract! kitten, :id, :name, :age, :cuteness, :softness
  json.url kitten_url(kitten, format: :json)
end
