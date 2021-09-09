# frozen_string_literal: true

module Api
  module V1
    class NotificationBotController < ApplicationController
      include JSONAPI::ActsAsResourceController
    end
  end
end
