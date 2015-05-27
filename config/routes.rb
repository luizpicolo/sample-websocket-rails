Rails.application.routes.draw do
  root 'product#index'
  get 'product/render_json/:id' => 'product#render_json'
  get 'product/:id' => 'product#show', as: :show_product
  get 'analytics' => 'analytics#index'
end
