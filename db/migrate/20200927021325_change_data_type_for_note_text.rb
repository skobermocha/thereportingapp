class ChangeDataTypeForNoteText < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {remove_column :project_notes, :note_text}
  end
end
