Rails.application.routes.draw do
	get '/' => 'sites#index'

	resources :books, only: [:index, :show, :new, :create]

end
