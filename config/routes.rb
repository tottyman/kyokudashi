Rails.application.routes.draw do
  
  # 顧客用　devise
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用 devise
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  
  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    resources :musics
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  
  
end
