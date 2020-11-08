class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      # コメント
      t.text :text, null: false
      # users テーブル
      t.references :user, foreign_key: true
      # prototypes テーブル
      t.references :prototype, foreign_key: true

      t.timestamps
    end
  end
end
