# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {:phone => '1', :password => '123456', :name => 'Marcus', :gender => 'm', :sexuality => 'straight', :birthday => '01-Jan-2000', :location => 'NY', :education => 'Bachelor', :career => 'Student', :height => '6.0', :profile_photo => nil, :created_time => '01-Jan-2022' },
  {:phone => '2', :password => '123456', :name => 'Zhen', :gender => 'f', :sexuality => 'straight', :birthday => '02-Feb-2001', :location => 'NY', :education => 'Master', :career => 'Student', :height => '6.0', :profile_photo => nil, :created_time => '01-Jan-2022' },
  {:phone => '3', :password => '123456', :name => 'Jack', :gender => 'm', :sexuality => 'straight', :birthday => '03-Mar-2002', :location => 'NY', :education => 'PhD', :career => 'Software Engineer', :height => '6.0', :profile_photo => nil, :created_time => '01-Jan-2022' },
  {:phone => '4', :password => '123456', :name => 'Hang', :gender => 'm', :sexuality => 'straight', :birthday => '04-Apr-2003', :location => 'NY', :education => 'High School', :career => 'Unemployed', :height => '6.0', :profile_photo => nil, :created_time => '01-Jan-2022' }
]
users.each do |user|
  User.create!(user)
end

interests = [
  {:uid => 1, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' },
  {:uid => 2, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' },
  {:uid => 3, :interest1 => 'N', :interest2 => 'N', :interest3 => 'N' },
  {:uid => 4, :interest1 => nil, :interest2 => nil, :interest3 => nil }
]
interests.each do |interest|
  Interest.create!(interest)
end

messages = [
  {:sender_uid => 1, :receiver_uid => 2, :timestamp => '01-Oct-2022 11:30:00', :message => 'Hello Zhen, How are you!', :is_read => true },
  {:sender_uid => 2, :receiver_uid => 1, :timestamp => '01-Oct-2022 13:30:00', :message => 'Hi Marcus!', :is_read => true },
  {:sender_uid => 1, :receiver_uid => 2, :timestamp => '01-Oct-2022 15:00:00', :message => 'Bye', :is_read => false }
]
messages.each do |message|
  Message.create!(message)
end

coupons = [
  {:name => 'Romantic Dining', :message => 'We found both of you love Italian food, so we reserved a table with coupon for you! Check this out!', :location => '116 Street, New York, NY 10000', :original_price => '1000.00', :discount_price => '50.00', :advertiser => 'Columbia Dining' },
  {:name => 'Romantic Dining', :message => 'We found both of you love Italian food, so we reserved a table with coupon for you! Check this out!', :location => '116 Street, New York, NY 10000', :original_price => '20.00', :discount_price => '8.00', :advertiser => 'Columbia Dining' },
  {:name => 'Romantic Dining', :message => 'We found both of you love Italian food, so we reserved a table with coupon for you! Check this out!', :location => '116 Street, New York, NY 10000', :original_price => '100.00', :discount_price => '20.00', :advertiser => 'Columbia Dining' }
]
coupons.each do |coupon|
  Coupon.create!(coupon)
end

activities = [
  {:status => 'PENDING', :coupon_id => 2, :datetime => '2022-01-01 18:00:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => false },
  {:status => 'DONE', :coupon_id => 2, :datetime => '2022-01-01 18:00:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => true },
  {:status => 'CONFIRMED', :coupon_id => 1, :datetime => '2022-01-01 18:00:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => true },
]
activities.each do |activity|
  Activity.create!(activity)
end

prompts = [
  {:uid => 1, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 2, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 3, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 4, :answer1 => nil, :answer2 => nil, :answer3 => nil }
]
prompts.each do |prompt|
  Prompt.create!(prompt)
end
