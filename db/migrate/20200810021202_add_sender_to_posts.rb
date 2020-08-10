class AddSenderToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sender, :integer
  end
end
