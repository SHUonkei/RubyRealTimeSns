class Message < ApplicationRecord
  belongs_to :room
end


# なお、Message モデル側にも関連付けを明示する必要がありますが、モデルを生成したときに関連性を明示していたため、すでに Message モデルには関連付けが記述されています。

# app/models/message.rb ファイル、生成時に既に belongs_to :room が書かれているはずです。

#多分referanceってやつをmodel作成時に書いたからだな
