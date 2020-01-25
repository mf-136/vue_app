class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } #リスト 13.17では新たに、ラムダ式 (Stabby lambda) という文法を使っています。これは、Procやlambda (もしくは無名関数)と呼ばれるオブジェクトを作成する文法です。->というラムダ式は、ブロック (4.3.2) を引数に取り、Procオブジェクトを返します。このオブジェクトは、callメソッドが呼ばれたとき、ブロック内の処理を評価します。
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
