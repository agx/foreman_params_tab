Rails.application.routes.draw do
  constraints(:id => /[^\/]+/) do
    resources :hosts do
      member do
        get 'parameters', to: 'foreman_params_tab/hosts#parameters'
      end
    end
  end
end
