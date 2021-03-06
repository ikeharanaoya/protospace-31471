class Prototype < ApplicationRecord
  # プロトタイプの名称
  validates :title, presence: true
  # キャッチコピー
  validates  :catch_copy, presence: true
  # コンセプト
  validates  :concept, presence: true
  # プロトタイプの画像1枚
  has_one_attached :image
  # 必須の設定
  validates :image, presence: true
  # user テーブル
  belongs_to :user
  # comments テーブル
  has_many :comments, dependent: :destroy
end
