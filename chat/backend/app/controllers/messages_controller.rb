class MessagesController < ApplicationController
    def index
    #このroom_idパラメータはどう渡される？？
    # indexを起動（？）するときに受け渡すんか？
      room = Room.find(params[:room_id])
    # room = Room.find(1)
    # だったら1をもってくるんか？？
      messages = room.messages.limit(20)
  
      render json: messages, status: :ok
    end
  
    def create
      room = Room.find(params[:room_id])
      message = room.messages.create(message_params)
      render json: message, status: :created
      #added
      
      ActionCable.server.broadcast "room_channel_#{params[:room_id]}", message
      
      # 上記のコードでは、create アクションの処理が完了したとき、
      # つまりメッセージが作成されたときに
      # そのメッセージを指定したチャンネルにブロードキャスト
      # "room_channel_#{params[:room_id]}" というチャンネル名を指定。

      # 特定のチャットルームのチャンネルにメッセージが送信されると、
      # そのチャンネルに接続（購読）しているすべてのクライアントに
      # そのメッセージが届けられるようになります。
    
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content, :sender_name)
    end
  end