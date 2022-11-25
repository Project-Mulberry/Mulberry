# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {:phone => '1234567890', :password => '123456', :name => 'Marcus', :gender => 'male', :sexuality => 'heterosexual', :birthday => '01-Jan-2000', :location => 'NY', :education => 'Bachelor', :career => 'Student', :height => '6.0', :profile_photo => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDU57T6Ux2hJckA1H7b1-MNJIW6JML3dLNcsipJgQ&s" },
  {:phone => '1234567891', :password => '123456', :name => 'Zhen', :gender => 'female', :sexuality => 'heterosexual', :birthday => '02-Feb-2001', :location => 'NY', :education => 'Master', :career => 'Student', :height => '5.9', :profile_photo => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5b1qcTjkXDHfRi-oHwXSkSUEHcUFc4S22Ig&usqp=CAU" },
  {:phone => '1234567892', :password => '123456', :name => 'Jack', :gender => 'male', :sexuality => 'heterosexual', :birthday => '03-Mar-2002', :location => 'NY', :education => 'PhD', :career => 'Software Engineer', :height => '5.8', :profile_photo => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTediDSOhVVnjdMY1UAE0qWAmm6jiPchrxUlg&usqp=CAU" },
  {:phone => '1234567893', :password => '123456', :name => 'Hang', :gender => 'female', :sexuality => 'heterosexual', :birthday => '04-Apr-2003', :location => 'NY', :education => 'High School', :career => 'Unemployed', :height => '5.7', :profile_photo => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQTZANi1eIVaDmAwJ96JSKryN8YuJxH_rW5w&usqp=CAU" },
  {:phone => '1234567894', :password => '123456', :name => 'robot', :gender => 'female', :sexuality => 'heterosexual', :birthday => '05-May-2004', :location => 'NY', :education => 'Bachelor', :career => 'Student', :height => '5.6', :profile_photo => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCpCB15apQNkZisVev293u6l5tSL4K7jySsA&usqp=CAU" }
]
users.each do |user|
  User.create!(user)
end

interests = [
  {:uid => 1, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' },
  {:uid => 2, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' },
  {:uid => 3, :interest1 => 'N', :interest2 => 'N', :interest3 => 'N' },
  {:uid => 4, :interest1 => '', :interest2 => '', :interest3 => '' },
  {:uid => 5, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' }
]
interests.each do |interest|
  Interest.create!(interest)
end

messages = [
  {:sender_uid => 1, :receiver_uid => 2, :key => '<1>-<2>', :timestamp => '01-Oct-2022 11:30:00', :message => 'Hello Zhen, How are you!', :is_read => true },
  {:sender_uid => 2, :receiver_uid => 1, :key => '<1>-<2>', :timestamp => '01-Oct-2022 13:30:00', :message => 'Hi Marcus!', :is_read => true },
  {:sender_uid => 1, :receiver_uid => 2, :key => '<1>-<2>', :timestamp => '01-Oct-2022 15:00:00', :message => 'Interested in the recommended activity?', :is_read => false },
  {:sender_uid => 1, :receiver_uid => 3, :key => '<1>-<3>', :timestamp => '01-Oct-2022 12:00:00', :message => 'Hi, what\'s up', :is_read => false },
  {:sender_uid => 3, :receiver_uid => 1, :key => '<1>-<3>', :timestamp => '01-Oct-2022 13:00:00', :message => 'Hey! How is it going?', :is_read => false },
  {:sender_uid => 4, :receiver_uid => 1, :key => '<1>-<4>', :timestamp => '01-Oct-2022 10:00:00', :message => 'Morning!', :is_read => false },
  {:sender_uid => 3, :receiver_uid => 4, :key => '<3>-<4>', :timestamp => '01-Oct-2022 18:00:00', :message => 'Wanna eat out?', :is_read => true }
]
messages.each do |message|
  Message.create!(message)
end

coupons = [
  {:name => 'Food', :message => 'Both of you love Italian food, check out this amazing Italian restaurant and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '1000.00', :discount_price => '50.00', :advertiser => 'Columbia Dining' },
  {:name => 'Music', :message => 'Both of you love Jazz Music, check out this amazing Jazz bar and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '20.00', :discount_price => '8.00', :advertiser => 'Columbia University' },
  {:name => 'Sports', :message => 'Both of you love Tennis, check out this amazing tennis club and enjoy our special coupon!', :location => '116 Street, New York, NY 10000', :original_price => '100.00', :discount_price => '20.00', :advertiser => 'Columbia University' }
]
coupons.each do |coupon|
  Coupon.create!(coupon)
end

activities = [
  {:status => 'DONE', :coupon_id => 2, :datetime => '2022-10-01 13:31:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => true },
  {:status => 'PENDING', :coupon_id => 3, :datetime => '2022-10-02 15:00:00', :fst_uid => 1, :fst_accept => false, :snd_uid => 2, :snd_accept => true },
  {:status => 'SCHEDULED', :coupon_id => 1, :datetime => '2022-10-03 18:00:00', :fst_uid => 1, :fst_accept => true, :snd_uid => 2, :snd_accept => true },
  {:status => 'PENDING', :coupon_id => 2, :datetime => '2022-01-01 18:00:00', :fst_uid => 3, :fst_accept => true, :snd_uid => 4, :snd_accept => false }
]
activities.each do |activity|
  Activity.create!(activity)
end

prompts = [
  {:uid => 1, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 2, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 3, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' },
  {:uid => 4, :answer1 => '', :answer2 => '', :answer3 => '' },
  {:uid => 5, :answer1 => 'prompt-1-answer', :answer2 => 'prompt-1-answer', :answer3 => 'prompt-1-answer' }
]
prompts.each do |prompt|
  Prompt.create!(prompt)
end

history_list = [
  {:uid => 1, :matched_uid => 4, :connected => false, :updated_time => '2022-11-01 12:00:00'},
  {:uid => 2, :matched_uid => 3, :connected => true, :updated_time => '2022-11-11 12:00:00'},
  {:uid => 4, :matched_uid => 1, :connected => true, :updated_time => '2022-11-11 12:00:00'}
]
history_list.each do |history|
  MatchHistory.create!(history)
end
