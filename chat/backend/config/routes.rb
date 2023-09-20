Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/test', to: 'application#test' # ここを追加
  resources :rooms, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end# この行を追加
end

# 上記のコードで、roomsリソースに対するルーティングを設定しました。
# これにより、特定のURLに対するHTTPリクエストをRoomsControllerのアクションにマッピングします。

# 具体的には、GET /rooms に対するリクエストは、RoomsControllerのindexアクションにマッピングされます。
# また、POST /rooms に対するリクエストは、RoomsControllerのcreateアクションにマッピングされます。

# それぞれ、Vue.js から Rails API に対してリクエストを送る際のURLになります。