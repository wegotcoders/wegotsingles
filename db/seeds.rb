Customer.destroy_all
Profile.destroy_all

genders = %w(male female other)
postcodes = %w(EN63AQ EN93TP EN110HD EN64NW EN55SR EN80NQ EN111HP EN36PX EN37SG EN28LH EN27AP EN11XN EN51SL EN93BS EN36QA EN20BY EN37EA EN107PA EN81LT EN53LH EN49QB EN92PT EN87JR EN111JB EN28DQ EN89XF EN87DJ EN88RJ EN65HH EN76EY EN55AJ EN14DU EN20HN EN26PR EN55SF EN19TH EN75NS EN87TH EN106RE EN14LW EN107DY EN28HR EN54JT EN62QE EN48DL EN93DE EN76LU EN75DH EN62DQ EN91SZ)
users = []

industries=[
    ["aerospace", ["astronaut", "rocket engineer", "fighter pilot", "motion design"]],
    ["agriculture", ["farmer", "broker", "shearer"]],
    ["civil_service", ["accountant", "paper-pusher"]],
    ["construction", ["builder", "project manager"]],
    ["defense", ["commander", "submarine navigator"]],
    ["education", ["teacher", "principal"]],
    ["energy", ["renewables marketer", "oil and gas broker"]],
    ["health", ["doctor", "nurse", "orthopedic surgeon", "psychiatrist"]],
    ["industrial", ["chemical engineer"]],
    ["technology", ["coder", "software engineer", "senior developer"]],
  ]   

20.times do 
  i = (0..9).to_a.sample
  users << {
  biography: Faker::Lorem.paragraph,
  drinks: [true, false].sample,
  weight: (40..140).to_a.sample,
  weight_unit: ["kg"],
  desires: Faker::Lorem.paragraph,
  postcode: postcodes.sample,
  name: Faker::Name.first_name,
  gender: genders.sample,
  smoker: [true, false].sample,
  industry: industries[i][0],
  occupation: industries[i][1].sample
  }

end

users.each_with_index do |user_data, i|
    customer = instance_variable_set :"@customer_#{i + 1}", Customer.create!(
      :email => Faker::Internet.email,
      :username => Faker::Internet.user_name,
      :date_of_birth => (18..55).to_a.sample.years.ago,
      :password => 'password', :password_confirmation => 'password')
    customer.profile.update(user_data)
    customer.confirm
end