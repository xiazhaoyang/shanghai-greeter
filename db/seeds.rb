puts 'Cleaning database...'
Experience.delete_all

puts 'Creating restaurants...'
Experience_attributes = [
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
    name:         "Museum",
    description:  "Shanghai is more than world-class restaurants and shopping. From the educational to the visually captivating, Shanghai’s museums will keep you coming back for more.Let us know what interests you and our greeter will make sure to bring you to a museum that you will love.",
    expectation_one: "A rich cultural experience",
    expectation_two: "Eye-opening art and creations",
    notice: "Discovery of historical European Architecture",
  },
  {
    name:         "Nightlife",
    description:  "Shanghai's nightlife is fast paced and a mix of all different kinds of scenes, from world-class clubbing, to casual drinks in a local speakeasy, there is always something for everyone. Let us know what kind of nightlife you like and have a local friend join you for the party.",
    expectation_one: "A local friend to enjoy Shanghai’s nightlife with",
    expectation_two: "Discover where the local go out",
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

]
Experience.create!(Experience_attributes)



puts "Creating photos"

a = 1
db_dir = File.dirname(__FILE__)

Experience.all.each do |experience|
  path = db_dir + "/images/image-#{a}.jpg"
  experience.photos = File.open(path)
  experience.save
  a += 1
end

puts "Finished!"





