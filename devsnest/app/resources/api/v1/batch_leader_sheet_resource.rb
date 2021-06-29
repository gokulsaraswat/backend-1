# frozen_string_literal: true

module Api
  module V1
    class BatchLeaderSheetResource < JSONAPI::Resource
      attributes :user_id, :group_id, :Coordination, :scrum_filled, :owner_active, :co_owner_active,
                 :rating, :creation_week, :active_members, :par_active_members, :inactive_members,
                 :doubt_session_taker

      def creatable_fields(context)
        super - %i[creation_week]
      end

      def updatable_fields(context)
        if context[:user].user_type == 'admin'
          super - %i[creation_week group_id]
        else
          super - %i[creation_week user_id group_id]
        end
      end

      def self.records(options = {})
        if options[:context][:params][:action] == 'index'
          date = Date.parse(options[:context][:params][:date])
          super(options).where(group_id: options[:context][:params][:group_id], creation_week: date.at_beginning_of_week)
        else
          super(options)
        end
      end
    end
  end
end