class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      # プロトタイプの名称
      t.string :title, null: false
      # キャッチコピー
      t.text :catch_copy, null: false
      # コンセプト
      t.text :concept, null: false
      # users テーブル
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
