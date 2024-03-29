Factory.define :user do |user|
    user.sequence(:email) {|n| "user_#{n}@shippie.com"}
    user.password "password"
    user.confirmed_at nil
end

Factory.define :transporter, :parent => :user do |user|
    user.role 'transporter'
end
