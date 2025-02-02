class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email,           null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.boolean :verified, null: false, default: false

      t.boolean :otp_required_for_sign_in, null: false, default: false
      t.string  :otp_secret, null: false

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :dob, null: false

      t.timestamps
    end
  end
end
