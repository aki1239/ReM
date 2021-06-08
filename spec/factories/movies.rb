FactoryBot.define do
  factory :movie do
    title                  { Faker::Lorem.sentence }
    genre_id               { 2 }
    phrase                 { Faker::Lorem.sentence }
    text                   { Faker::Lorem.sentence }


    after(:build) do |movie|
      movie.image.attach(io: File.open('public/images/movie1.jpg'), filename: 'movie1.jpg')
    end
    association :user
  end
end
