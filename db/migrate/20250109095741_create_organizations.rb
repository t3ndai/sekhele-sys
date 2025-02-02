class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
