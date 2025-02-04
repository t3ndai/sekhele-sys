class RenameTypeToDocumentsTypeInEmployees < ActiveRecord::Migration[8.0]
  def change
    rename_column :documents, :type, :document_type
  end
end
