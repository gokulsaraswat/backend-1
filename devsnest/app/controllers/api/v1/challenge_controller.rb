# frozen_string_literal: true

module Api
  module V1
    # allows challenges api calls to challenge resources
    class ChallengeController < ApplicationController
      include JSONAPI::ActsAsResourceController

      def context
        { challenge_id: params[:id] }
      end
    end
  end
end
