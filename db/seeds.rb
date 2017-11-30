# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts 'Cleaning database...'
# Experience.destroy_all





# NAME = [
#   "The Bund","Culture","Local Food","Photography"
# ]

# EXPECTATION = [
#   "Great views of the city", "Many people and a nice source of people watching", "Beautiful photos of Shanghai’s iconic skyline"
# ]


# DESCRIPTION = [
# "The Bund is a famous waterfront area in central Shanghai that runs along the Huangpu River. The area along the river faces the modern skyscrapers of Lujiazui in the Pudong District. The Bund usually refers to the buildings and wharves on this section of the road, as well as some adjacent areas. The best way to appreciate the buildings and its surroundings is to have a walk along the Bund. Roaming among the architectural complexes, you'll have a better understanding of the century-long charm of this city.!",
# "This experience is perfect for travellers who don’t want to see just typical highlights, and love learning about the unique parts of different cultures. Shanghai is full of unusual sites and has a rich history of culture and heritage. Maybe it’s the marriage market, dancing ayis in the park, or a group of elderly playing mah-jong. Dive right in and see more in the daily life!",
# "Are you a foodie? Let our greeter guide you and your taste buds on a culinary journey. Step away from the hotel buffet and explore some of the locals’ favorite eats the city has to offer. You may have heard about Shanghai’s famous dumplings or noodles, but there’s much more!",
# "With its unique mix of architectural styles and an ever-changing cityscape, we’re confident that Shanghai is one of the most photogenic cities out there. Join a greeter who also loves photography and explore a local Shanghai neighborhood. Things change so fast around here, your photos may be capturing a place on the brink of change!",
# ]




# puts 'Creating fake data...'


# 6.times do
#   Experience.create(
#       name: NAME.sample,
#       description: DESCRIPTION.sample,
#       Expectation1:
#       Expectation2:
#       Expectation3:
#       Expectation4:
#       )
#   puts 'created item'
# end





puts 'Cleaning database...'
Experience.delete_all

puts 'Creating restaurants...'
Experience_attributes = [
  {
    name:         "Museum",
    description:  "Shanghai is more than world-class restaurants and shopping. From the educational to the visually captivating, Shanghai’s museums will keep you coming back for more.Let us know what interests you and our greeter will make sure to bring you to a museum that you will love.",
    expectation_one: "A rich cultural experience",
    expectation_two: "Eye-opening art and creations",
    notice: "Discovery of historical European Architecture",
  },
  {
    name:         "The Bund",
    description:  "The Bund is a famous waterfront area in central Shanghai that runs along the Huangpu River. The area along the river faces the modern skyscrapers of Lujiazui in the Pudong District. The Bund usually refers to the buildings and wharves on this section of the road, as well as some adjacent areas. The best way to appreciate the buildings and its surroundings is to have a walk along the Bund. Roaming among the architectural complexes, you'll have a better understanding of the century-long charm of this city.",
    expectation_one: "Great views of the city",
    expectation_two: "Many people and a nice source of people watching",
    expectation_three: "Beautiful photos of Shanghai’s iconic skyline",
    notice: "Discovery of historical European Architecture",
  },
  {
    name:         "Culture",
    description:  "This experience is perfect for travellers who don’t want to see just typical highlights, and love learning about the unique parts of different cultures. Shanghai is full of unusual sites and has a rich history of culture and heritage. Maybe it’s the marriage market, dancing ayis in the park, or a group of elderly playing mah-jong. Dive right in and see more in the daily life! .",
    expectation_one: "Great views of the city",
    expectation_two: "Many people and a nice source of people watching",
    expectation_three: "Beautiful photos of Shanghai’s iconic skyline",
    notice: "Discovery of historical European Architecture",
  },
  {
    name:         "Local Food",
    description:  "Are you a foodie? Let our greeter guide you and your taste buds on a culinary journey. Step away from the hotel buffet and explore some of the locals’ favorite eats the city has to offer. You may have heard about Shanghai’s famous dumplings or noodles, but there’s much more!",
    expectation_one: "Great views of the city",
    expectation_two: "Many people and a nice source of people watching",
    expectation_three: "Beautiful photos of Shanghai’s iconic skyline",
    notice: "Discovery of historical European Architecture",
  },
  {
    name:         "Photography",
    description:  "With its unique mix of architectural styles and an ever-changing cityscape, we’re confident that Shanghai is one of the most photogenic cities out there. Join a greeter who also loves photography and explore a local Shanghai neighborhood. Things change so fast around here, your photos may be capturing a place on the brink of change!
",
    expectation_one: "Great views of the city",
    expectation_two: "Many people and a nice source of people watching",
    expectation_three: "Beautiful photos of Shanghai’s iconic skyline",
    notice: "Discovery of historical European Architecture",
  },
  {
    name:         "Nightlife",
    description:  "Shanghai's nightlife is fast paced and a mix of all different kinds of scenes, from world-class clubbing, to casual drinks in a local speakeasy, there is always something for everyone. Let us know what kind of nightlife you like and have a local friend join you for the party.",
    expectation_one: "A local friend to enjoy Shanghai’s nightlife with",
    expectation_two: "Discover where the local go out",
  },
]
Experience.create!(Experience_attributes)
puts "Finished!"


def generate_images(experience)
  # NOTE: This is example is written for the model "Item" with images
  # saved as "image" via attachinary. If you are calling it something
  # different (ex. "avatar"), then you will need to change the code.
  # Likewise, if your model is different name, you will need to change
  # the model calls in the method. Place this method in "Seeds" file.

  # The method is passed two paramters: 'category' (a string), &
  # 'item' (the object that you will have the image seeded for)

  # -------------------------------------------------------
  # ----------------------START METHOD---------------------
  # -------------------------------------------------------

  db_dir = File.dirname(__FILE__)
  # Gets folder of /db/ in Rails.

  image_ranges = [
    "image-1",
    "image-2",
    "image-3",
    "image-4",
    "image-5",
    "image-6"

  ]
  # "category_1", ... IMPORTANT: The categories must be strings. No Symbols.
  # For the ranges for each catgory (i.e. "(1..5).to_a"), change the number "5"
  # to the number of images for that category that you have.

  # Item Range Example: "windsurfing" => (1..3).to_a
  # ((This is for files named: "windsurfing-1.jpg", "windsurfing-2.jpg", etc.))

  # Item Range Example (for User): "female" => (1..7).to_a
  # ((This is an example for using categories for gendered-photos for user avatar))
  random_number_for_experience = image_ranges.sample
  # This chooses the random number within a range of images (ex: 1, 2, 7, 17, 3)

  path = db_dir + "/images/#{random_number_for_experience}.jpg"
  # This sets the path to "windsurfing-1.jpg" in /db/images/ directory.

  experience.photos = File.open(path)
  # This uploads the item via attachinary.
  # NOTE: the .image should change based on your migration.

  # ex: if using  "avatar" for User model, then change to "item.avatar"

  experience.save
  # Saves item after image upload.
end


Experience.all.each do |experience|
  generate_images(experience)

end
