require 'rest-client'
require 'pry'
require 'faker'

User.destroy_all

# if we wanted to isolate certain fish, we could use these SpecCodes from the JSON data but we would have to pull thousands of records to get all of these unless we can find a way to revise our query to include these

    # popular_fish_code = [3385, 58432, 3382, 62256, 66684, 3384, 239, 3387, 3388, 268, 3019, 290, 79, 1450]

res = RestClient.get 'https://fishbase.ropensci.org/species', params: {limit: 50}
# isolates key with fish data
res_ary = JSON.parse(res)["data"]
# filters the array to get better curated collection of fish for our app
fish_ary = res_ary.select { |fish| fish["FBname"] != nil && fish["GameFish"] = -1 && fish["Fresh"] = -1 }

20.times do
    User.create(name: Faker::Name.name, bio: Faker::GreekPhilosophers.quote, username: Faker::Internet.username, email: Faker::Internet.email)
end

fish_ary.each do |fish|
    Fish.create(species: fish["FBname"], description: fish["Comments"])
end
# binding.pry