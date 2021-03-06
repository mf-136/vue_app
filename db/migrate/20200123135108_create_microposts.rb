class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    # また、user_idとcreated_atの両方を１つの配列に含めている点にも注目です。こうすることでActive Recordは、両方のキーを同時に扱う複合キーインデックス (Multiple Key Index) を作成します。
    add_index :microposts, [:user_id, :created_at] #ここで、リスト 13.3ではuser_idとcreated_atカラムにインデックスが付与されていることに注目してください (コラム 6.2)。こうすることで、user_idに関連付けられたすべてのマイクロポストを作成時刻の逆順で取り出しやすくなります。
  end
end
