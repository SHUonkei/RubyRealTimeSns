class RoomsController < ApplicationController
    def index
    #Room は　ルームモデルのclass名
      rooms = Room.all
      render json: rooms, status: :ok
    end
  
    def create
        #room_params。。。？
      room = Room.create(room_params)
      render json: room, status: :created
    end
    
    
    private
    
    def room_params
      puts "this is params"
      puts params
      params.require(:room).permit(:name)
    end
  end

#   index アクション:

#   Room モデルの全てのデータを取得して、JSON形式でレスポンスを返します。
#   最後に render メソッドを呼び出して、rooms をJSON形式でレスポンスとして返します。

#   create アクション:

#   Room モデルに新しいデータを作成して、JSON形式でレスポンスを返します。
#   最後に render メソッドを呼び出して、作成された room をJSON形式でレスポンスとして返します。