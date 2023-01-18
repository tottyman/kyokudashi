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
    resources :bands, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :members, only: [:create, :destroy]
    end
  end

  # admin側のルーティング設定
  namespace :admin do
    get 'top' => 'homes#top'
    patch 'top' => 'homes#update'
    delete 'top' => 'homes#destroy'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :bands, only: [:index, :show, :edit, :create, :update, :destroy] do
      member do
        patch 'change_up'
        patch 'change_down'
      end
      resources :members, only: [:create, :destroy]
    end
    resources :musics, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        get 'timetable'
      end
    end

  end

end
