# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {:username => 'user1', :password => '12345678', :name => 'Marcus', :gender => 'm', :birthday => '01-Jan-2000', :email => 'test@columbia.edu', :created_time => '01-Jan-2022', :city => 'New York', :profile_photo => nil },
  {:username => 'user2', :password => '12345678', :name => 'Zhen', :gender => 'f', :birthday => '02-Feb-2001', :email => 't1@columbia.edu', :created_time => '01-Jan-2022', :city => 'New York', :profile_photo => nil },
  {:username => 'user3', :password => '12345678', :name => 'Jack', :gender => 'm', :birthday => '03-Mar-2002', :email => 't2@columbia.edu', :created_time => '01-Jan-2022', :city => 'Mountain View', :profile_photo => nil },
  {:username => 'user4', :password => '12345678', :name => 'Hang', :gender => 'm', :birthday => '04-Apr-2003', :email => 't3@columbia.edu', :created_time => '01-Jan-2022', :city => 'Los Angles', :profile_photo => nil }
]
users.each do |user|
  User.create!(user)
end

interests = [
  {:uid => 1, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' },
  {:uid => 2, :interest1 => 'Y', :interest2 => 'Y', :interest3 => 'Y' },
  {:uid => 3, :interest1 => 'N', :interest2 => 'N', :interest3 => 'N' },
  {:uid => 4, :interest1 => 'Y', :interest2 => 'N', :interest3 => 'Y' }
]
interests.each do |interest|
  Interest.create!(interest)
end

messages = [
  {:sender_id => 1, :receiver_id => 2, :timestamp => '01-Oct-2022 11:30:00', :message => 'Hello Zhen, How are you!', :is_read => true },
  {:sender_id => 2, :receiver_id => 1, :timestamp => '01-Oct-2022 13:30:00', :message => 'Hi Marcus!', :is_read => true },
  {:sender_id => 1, :receiver_id => 2, :timestamp => '01-Oct-2022 15:00:00', :message => 'Bye', :is_read => false }
]
messages.each do |message|
  Message.create!(message)
end

coupons = [
  {:content => 'dinner - 1', :name => 'Columbia Dining', :location => '116 Street, New York, NY 10000', :original_price => '1000.00', :discount_price => '50.00'},
  {:content => 'dinner - 2', :name => 'Columbia Dining', :location => '116 Street, New York, NY 10000', :original_price => '20.00', :discount_price => '8.00'},
  {:content => 'dinner - 3', :name => 'Columbia Dining', :location => '116 Street, New York, NY 10000', :original_price => '100.00', :discount_price => '20.00'}
]
coupons.each do |coupon|
  Coupon.create!(coupon)
end

activities = [
  {:status => 'DONE', :start_time => '01-Oct-2022', :end_time => '31-Oct-2022', :coupon_id => '2', :fst_user => 1, :snd_user => 2 },
  {:status => 'CONFIRMED', :start_time => '01-Nov-2022', :end_time => '30-Nov-2022', :coupon_id => '1', :fst_user => 1, :snd_user => 2 },
]
activities.each do |activity|
  Activity.create!(activity)
end
