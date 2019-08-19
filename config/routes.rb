Rails.application.routes.draw do
  resources :blogs
  devise_for :users
  root 'blogs#index'
  get   'blogs'      =>  'blogs#index'     #ツイート一覧画面
  get   'blogs/new'  =>  'blogs#new'       #ツイート投稿画面
  post  'blogs'      =>  'blogs#create'    #ツイート投稿機能
  delete 'blogs/:id' => 'blogs#destroy'
  get   'blogs/:id/edit' => 'blogs#edit'
  patch 'blogs/:id'  =>  'blogs#update'
  

end
