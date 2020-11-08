class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ユーザー名
  validates :name, presence: true
  # プロフィール
  validates :profile, presence: true
  # 所属
  validates :occupation, presence: true
  # 役職
  validates :position, presence: true
  # protoypes テーブル
  has_many :prototypes, dependent: :destroy
  # comments テーブル
  has_many :comments, dependent: :destroy
end
