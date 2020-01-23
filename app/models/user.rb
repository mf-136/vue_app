class User < ApplicationRecord
  # same self.email = self.email.downcase 左式のselfは省略不可
  # same before_save { self.email = email.downcase }
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password # has_secure_passwordメソッドは存在性のバリデーションもしてくれるのですが、これは新しくレコードが追加されたときだけに適用される性質を持っています。したがって、例えばユーザーが ' ' (6文字分の空白スペース) といった文字列をパスワード欄に入力して更新しようとすると、バリデーションが適用されずに更新されてしまう問題が発生してしまうのです。
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true




end
