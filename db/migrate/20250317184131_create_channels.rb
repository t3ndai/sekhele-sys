class CreateChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :channels do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
