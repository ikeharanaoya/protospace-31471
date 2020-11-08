class Comment < ApplicationRecord
  # コメント
  validates :text, presence: true
  # user テーブル
  belongs_to :user
  # protoype テーブル
  belongs_to :prototype
end
