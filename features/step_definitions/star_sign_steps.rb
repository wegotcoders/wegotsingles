Given(/^it has been created$/) do
  @customer = Customer.create!(username: "joe", 
    email: "joe@bloggs.com",
    password: "password", 
    password_confirmation: "password",
    confirmation_sent_at: Time.now - 1.day,
    confirmed_at: Time.now,
    date_of_birth: Date.new(1966,2,12))

  @profile = Profile.create!(
    biography: "A long time ago, in a galaxy far away...", 
    customer: @customer)
end

Then(/^their star sign is automatically set$/) do
  star_signs = ["Capricorn","Aquarius","Pisces","Aries","Taurus","Gemini",
                "Cancer","Leo","Virgo","Libra","Scorpio","Sagittarius"]
  
  expect(star_signs).to include(@profile.star_sign)
end