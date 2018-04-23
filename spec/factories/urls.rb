FactoryBot.define do
  factory :url do
    link { Faker::Internet.url('google.com', '/') }
  end

  factory :badurl do
    link { Faker::Internet.url('google.com', '/') }
  end
end
