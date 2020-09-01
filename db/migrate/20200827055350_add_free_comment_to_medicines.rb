class AddFreeCommentToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :free_comment, :text
  end
end
