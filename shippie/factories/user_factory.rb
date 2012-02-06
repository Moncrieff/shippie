Factory.define :user do |user|
  user.email "user_#{rand(1000).to_s}@shippie.com"
  user.password "password"
  user.confirmed_at nil
end
