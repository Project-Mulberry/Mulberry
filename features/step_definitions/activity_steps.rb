Given /the following coupons exist/ do |coupon_table|
  coupon_table.hashes.each do |coupon|
    Coupon.create(coupon)
  end
end

Given /the following activities exist/ do |activity_table|
  activity_table.hashes.each do |activity|
    Activity.create(activity)
  end
end

