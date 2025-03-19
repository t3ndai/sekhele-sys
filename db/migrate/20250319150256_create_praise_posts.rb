class CreatePraisePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :praise_posts do |t|
      t.belongs_to :nominee, null: false, foreign_key: { to_table: :employees }
      t.belongs_to :nominator, null: false, foreign_key: { to_table: :employees }
      t.belongs_to :praise_type, null: false, foreign_key: true
      t.text :message
      t.belongs_to :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
