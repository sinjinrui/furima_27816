class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  zenkaku_REGEX = /\A[ぁ-んァ-ン一-龥]/
  kana_REGEX = /\A[ァ-ヶー－]+\z/
  password_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i

  with_options presence: true do
    validates :first_name, format: { with: zenkaku_REGEX, message: "は全角で入力してください"}
    validates :last_name, format: { with: zenkaku_REGEX, message: "は全角で入力してください"}
    validates :first_name_kana, format: { with: kana_REGEX, message: "は全角カタカナで入力してください"}
    validates :last_name_kana, format: { with: kana_REGEX, message: "は全角カタカナで入力してください"}
    validates :password, format: { with: password_REGEX }
    validates :email, uniqueness: true
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birthday
  end

  has_many :orders
  has_many :products
end
