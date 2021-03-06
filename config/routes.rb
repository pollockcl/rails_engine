Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/customer', to: 'customer#show'
        get '/:id/merchant', to: 'merchant#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
     end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/:id/item', to: 'item#show'
        get '/:id/invoice', to: 'invoice#show'
      end

      namespace :items do
        get '/find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get 'most_revenue', to: 'revenue#show'
        get '/most_items', to: 'sold#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
        get '/:id/best_day', to: 'best_day#show'
      end

      namespace :merchants do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoice#index'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
        get '/most_revenue', to: 'most_revenue#show'
        get '/:id/revenue', to: 'revenue#show'
        get '/revenue', to: 'date_revenue#show'
        get '/:id/customers_with_pending_invoices', to: 'pending_invoices#show'
        get '/most_items', to: 'business#index'
      end

      namespace :transactions do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
      end

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
        get '/:id/invoices', to: 'invoice#show'
        get '/:id/transactions', to: 'transaction#show'
        get '/:id/favorite_merchant', to: 'merchant#show'
      end

      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
