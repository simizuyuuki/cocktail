FactoryBot.define do
  factory :tweet do
    name{'test'}
    text{'test'}

    association :user
    after(:build)do |message|
      message.image.attach(io: File.open('public/images/logo.png.png'), filename: 'logo.png.png')
    end
  end
end
