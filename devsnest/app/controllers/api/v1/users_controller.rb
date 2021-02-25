# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :simple_auth, only: %i[leaderboard report show]
      before_action :bot_auth, only: %i[left_discord create index]
      before_action :user_auth, only: [:log_out]

      def report
        discord_id = params[:discord_id]
        user = User.find_by(discord_id: discord_id)
        return render_error('User not found') if user.nil?

        days = params[:days].to_i || nil
        res = Submission.user_report(days, user.id)
        render json: res
      end

      def leaderboard
        page = params[:page].to_i
        offset = [(page - 1) * 10, 0].max
        scoreboard = User.order(score: :desc).limit(10).offset(offset)
        pages_count = (User.count % 10).zero? ? User.count / 10 : User.count / 10 + 1
        render json: { scoreboard: scoreboard, count: pages_count }
      end

      def log_out
        reset_session
        render json: { notice: 'You logged out successfuly' }
      end

      def create
        discord_id = params['data']['attributes']['discord_id']
        user = User.find_by(discord_id: discord_id)
        if user
          user.discord_active = true
          user.save
          return render_success(user.as_json.merge({ "type": 'users', status: 'status updated' }))
        end
        super
      end

      def left_discord
        discord_id = params['data']['attributes']['discord_id']
        user = User.find_by(discord_id: discord_id)
        user.discord_active = false
        user.save
        render_success(user.as_json.merge({ "type": 'users', status: 'status updated' }))
      end
    end
  end
end
