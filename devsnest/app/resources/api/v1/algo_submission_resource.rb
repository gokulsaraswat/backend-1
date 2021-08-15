# frozen_string_literal: true

module Api
  module V1
    class AlgoSubmissionResource < JSONAPI::Resource
<<<<<<< HEAD
      attributes :user_id, :challenge_id, :source_code, :language_id, :test_cases, :total_test_cases, :passed_test_cases, :is_submitted, :status, :total_runtime, :total_memory
=======
      attributes :user_id, :challenge_id, :source_code, :language_id, :test_cases, :total_test_cases, :passed_test_cases, :is_submitted
>>>>>>> parent 4c495053c0d51ae0acca3571f615c8c9417182e8
    end
  end
end
