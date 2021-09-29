FactoryBot.define do
    factory :comment do
      title {'Test_title'}
      content { 'Test_comment' }
      email {'test_email'}
    end
end
