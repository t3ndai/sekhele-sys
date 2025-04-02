class CreateAgendaItems < ActiveRecord::Migration[8.0]
  def change
    create_table :agenda_items do |t|
      t.string :name
      t.belongs_to :employee, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
