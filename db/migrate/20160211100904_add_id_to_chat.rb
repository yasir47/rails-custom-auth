class AddIdToChat < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :room_id, :string
  end
end
