class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
end

# オプションである dependent: :destroy は、
#Room が削除されたときに関連する
# Message も一緒に削除されることを示しています。