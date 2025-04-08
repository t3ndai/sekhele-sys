class AddOutlineToCareerVision < ActiveRecord::Migration[8.0]
  def change
    add_column :career_visions, :outline, :string
  end
end
