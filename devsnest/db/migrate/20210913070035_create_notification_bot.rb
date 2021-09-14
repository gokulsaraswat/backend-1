class CreateNotificationBot < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_bots do |t|
      t.string :bot_token
    end
  end
end
