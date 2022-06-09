FactoryBot.define do
  factory :gif do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.gif')) }

    trait :with_big_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'big_image.gif')) }
    end

    trait :with_jpg_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'jpg_image.jpg')) }
    end
  end
end
