# frozen_string_literal: true

FactoryBot.define do
  factory :judgeztoken do
    
  end

  factory :testcase do
    
  end

  factory :algo_submission do
    
  end

  factory :challenge do
    
  end

  factory :internal_feedback do
    sequence(:issue_details) { 'This is the description' }
    sequence(:solution) { 'feedback for the team' }
    sequence(:issue_scale) { rand(1..10) }
  end

  factory :content do
    sequence(:name) { |n| "Test Q #{n}" }
    sequence(:link) { |n| "Test link #{n}" }
    sequence(:data_type) { [0, 1, 2, 3, 4].sample }
    sequence(:difficulty) { [0, 1, 2].sample }
  end

  factory :weekly_todo do
    sequence(:group_id) { |n| n }
    sequence(:creation_week) { Date.today.at_beginning_of_week }
  end

  factory :group do
    sequence(:name) { |n| "#{n} group" }
    sequence(:batch_leader_id) { |n| n }
    sequence(:owner_id) { |n| n }
    sequence(:co_owner_id) { |n| n }
  end
  factory :group_member do
    sequence(:user_id) { |n| n }
    sequence(:group_id) { |n| n }
    sequence(:owner) { [true, false].sample }
  end
  factory :user do
    sequence(:name) { |n| "#{n} user" }
    sequence(:email) { |n| "#{n}@test.com" }
    sequence(:username, &:to_s)
    sequence(:dob) { Time.zone.now - rand(3000).days }
    sequence(:discord_id) { |n| n }
    sequence(:password) { |n| "mypass#{n}" }
    sequence(:web_active) { |_n| true }
    sequence(:image_url) { |n| "test.com/#{n}.png" }
    sequence(:score) { rand(1..100) }
  end

  factory :batch_leader_sheet do
    sequence(:user_id) { |n| n }
    sequence(:group_id) { |n| n }
  end

  factory :college do
    sequence(:name) { |n| "#{n}'th college" }
  end

  factory :frontend_submission do
    sequence(:user_id) { |n| n }
    sequence(:content_id) { |n| n }
  end

  factory :scrum do
    sequence(:user_id) { |n| n }
    sequence(:group_id) { |n| n }
  end

  factory :submission do
    sequence(:user_id) { |n| n }
    sequence(:content_id) { |n| n }
  end

  factory :link do
    sequence(:slug) { |n| n }
    sequence(:address) { |n| n }
  end

  factory :hackathon do
    sequence(:title) { |n| n }
  end

  factory :markdown do
    sequence(:template) { |n| n }
  end

  factory :event do
    sequence(:message) { |n| n }
  end

  factory :notification_bot do
    sequence(:bot_username) { |n| n }
  end

  factory :certification do
    sequence(:user_id) { |n| n }
  end
end
