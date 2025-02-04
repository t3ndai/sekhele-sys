class CreateDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :type
      t.boolean :required
      t.belongs_to :organization, null: false, foreign_key: true


      t.timestamps
    end
  end
end
