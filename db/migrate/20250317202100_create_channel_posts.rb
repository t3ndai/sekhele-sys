class CreateChannelPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :channel_posts do |t|
      t.belongs_to :creator, null: false, foreign_key: { to_table: :employees }
      t.integer :likes
      t.belongs_to :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
