class CreateChannelMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :channel_memberships do |t|
      t.belongs_to :channel, null: false, foreign_key: true
      t.belongs_to :member, null: false, foreign_key: { to_table: :employees }

      t.timestamps
    end
  end
end
