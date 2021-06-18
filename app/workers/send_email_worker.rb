# frozen_string_literal: true

class SendEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find_by(id: user_id)
    puts "#{user.email} created a new user"
    puts 'Inside send email worker'
  end
end
