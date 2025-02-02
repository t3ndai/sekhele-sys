class CreateRecoveryCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :recovery_codes, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true
      t.string  :code, null: false
      t.boolean :used, null: false, default: false

      t.timestamps
    end
  end
end
