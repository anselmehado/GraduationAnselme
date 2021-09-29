FactoryBot.define do
  factory :publication do

    title { 'Title 1'}
    content { 'Content 1' }
    #category { 'categori1' }
    image {'image 1'}
    association :anselme

  end
end
