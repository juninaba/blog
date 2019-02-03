class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps null: false
    end

    #あるユーザーが同じユーザーを２回以上フォローするのを防ぐ
    add_index :relationships, :follower_id
    add_index :relationships, :following_id
    add_index :relationships, [:follower_id, :following_id], unique: true

  end
end
