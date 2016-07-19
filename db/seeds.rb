# SEEDING THE PROFILES FOR DISPLAY OF GENDER SEARCH STORY
genders = %w(male female other)

20.times do 
  Profile.find_or_create_by(name: Faker::Name.first_name, gender: genders[Random.new.rand(genders.length)])
end

