# frozen_string_literal: true

# worker that identify user emails
class CustomerioWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id)
    user = User.find(user_id)
    $customerio.identify(
      id: user.id,
      email: user.email
    )
  end
end
