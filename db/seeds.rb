require 'rest-client'
require 'soda'
require 'unsplash'
require 'pry'
require 'faker'

Favorite.destroy_all
Review.destroy_all
FishingSpot.destroy_all
User.destroy_all
Fish.destroy_all
FishSpot.destroy_all

# USER SEED
50.times do
    User.create(name: Faker::Name.name, bio: Faker::GreekPhilosophers.quote, username: Faker::Internet.username, email: Faker::Internet.email, is_active: true)
end

# FISHING SPOT SEEDING
# Unsplash spot image API
lake_res = Unsplash::Photo.search('lakes', page = 1, per_page = 30)

# NY State Spot API
SPOT_url = "https://data.ny.gov/resource/f4vj-p8y5.json"
# have to set up account to get app token and thereby permission to ping/request
# instantiates new request

client = SODA::Client.new({:domain => "data.ny.gov", :app_token => "MeaTvwcpUia4zt1PESdUy9K1B"})
# JSON get request
response = client.get("f4vj-p8y5", :$limit => 20)
spots = response.body

# iterate over spots to create new records with API data
spots.each do |spot|
    fs = FishingSpot.new(user_id: User.all.sample.id, name: spot.name, longitude: spot.location.longitude, latitude: spot.location.latitude, public_access: spot.public_acc, image: lake_res.sample.urls.regular, is_active: true)
    if !spot.site_wl
        fs.save!
    else
        spot.site_wl.url
        fs.site_info = spot.site_wl.url
        fs.save!
    end
end


# FISH API
# if we wanted to isolate certain fish, we could use these SpecCodes from the JSON data but we would have to pull thousands of records to get all of these unless we can find a way to revise our query to include these
    # popular_fish_code = [3385, 58432, 3382, 62256, 66684, 3384, 239, 3387, 3388, 268, 3019, 290, 79, 1450]

FISH_url = 'https://fishbase.ropensci.org/species'
res = RestClient.get FISH_url, params: {limit: 50}
# isolates key with fish data
res_ary = JSON.parse(res)["data"]
# filters the array to get better curated collection of fish for our app
fish_ary = res_ary.select { |fish| fish["FBname"] != nil && fish["GameFish"] = -1 && fish["Fresh"] = -1 }
# create seed data
fish_ary.each do |fish|
    Fish.create(species: fish["FBname"], description: fish["Comments"], image: fish["image"], is_active: true)
end

# create reviews seed data
50.times do
    Review.create(title: Faker::Book.title, content: Faker::Lorem.paragraph, rating: rand(0..5), fishing_spot_id: FishingSpot.all.sample.id, user_id: User.all.sample.id)
end

# create favorite seed data
# randomly favorite a spot for each spot belonging to a user
50.times do
    Favorite.create(user_id: User.all.sample.id, fishing_spot_id: FishingSpot.all.sample.id)
end

#create FishSpots seed data
# randomly assign fish to fishing spots
50.times do
    FishSpot.create(fish_id: Fish.all.sample.id, fishing_spot_id: FishingSpot.all.sample.id)
end