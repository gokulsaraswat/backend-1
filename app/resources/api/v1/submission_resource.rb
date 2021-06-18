# frozen_string_literal: true

module Api
  module V1
    class SubmissionResource < JSONAPI::Resource
      attributes :user_id, :content_id, :status
    end
  end
end
