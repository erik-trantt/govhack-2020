# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Chatroom.create!(name: 'general')
# bot = User.create(username: 'bot', email: 'chatbot@sample.com', password: '')
# bot.password = "B2ui&*asd.._@"
# bot.save!
p "Please use db:reset to seed database"
p "-----"
p "Seeding database"
p "-----"
p "Creating 4 paths"
Path.create!(
  name: "COVID 19 support for individuals")
Path.create!(
  name: "Seeking employment")
Path.create!(
  name: "Find the nearest Work and Income Service Centre")
Path.create!(
  name: "I have urgent or unexpected costs to cover")
p "Done!"
p "-----"
p "Creating questions"
q_array1 = [
"Tell us your age to get started",
"What best describes your relationship?",
"Do you have dependent children?",
"Are you enrolled (or planning to enrol) in full time study at a secondary school, university, college of education, wananga or private training organisation?",
"How was your employment affected by COVID-19",
"Have you lived in New Zealand for at least 2 years at any one time since becoming a NZ citizen or permanent resident?",
"Thank you! Based on the answers you've given us, you qualify for COVID-19 Income Relief Payment. Please call Diane on 0800 559 009 and quote the reference number 75346. Diane is expecting your call and has all the information that you've provided."
]
q_array1.each do |q|
  Question.new(content: q)
  Question.path = Path.find(1)
  Question.save!
end
q_array2 = [
"Tell us your age to get started",
"Do you have any previous work experience? If so, in what industries?",
"Are you willing to try something new?",
"How soon would you like to start work?",
"Great! The NZ Government is currently subsidising training to aid COVID-19 recovery. We would love to speak with you about this. All are operators are currently busy, but I've scheduled a call with one of our case workers Manaia in 45 minutes. Is it ok to call you on this number at this time?",
"Speak to you soon. I will send you a notification 5 minutes before your call with Manaia."
]
q_array2.each do |q|
  Question.new(content: q)
  Question.path = Path.find(2)
  Question.save!
end
q_array3 = [
"I can help you with that! What is your current location?",
"Based on your location, your closest Work and Income Service Centre will be 562 Richmond Road, Grey Lynn, Auckland 1021. Would you like me to make you an appointment?",
"The earliest appointment I can make is with Rawiri next Thursday at 10:00am. Does that work for you?",
"Great, I've emailed those details across to you."
]
q_array3.each do |q|
  Question.new(content: q)
  Question.path = Path.find(3)
  Question.save!
end
q_array4 = [
"If you're struggling to meet your living costs, or get an unexpected bill, we might be able to help you, even if you're working. What can I help you with?",
"I'll need to bring in a specialist for this! All are operators are currently busy, but I've scheduled a call with one of our case workers Mark in 15 minutes. Is it ok to call you on this number at this time?",
"Speak to you soon. I will send you a notification 5 minutes before your call with Manaia."
]
q_array4.each do |q|
  Question.new(content: q)
  Question.path = Path.find(4)
  Question.save!
end
p "Database seeded succesfully!"
