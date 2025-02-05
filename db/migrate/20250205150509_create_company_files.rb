class CreateCompanyFiles < ActiveRecord::Migration[8.0]
  def change
    create_table :company_files do |t|
      t.string :name
      t.references :document, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
