Validart::Application.routes.draw do
  resources :external_validations, :only => [:index]
end
#               Prefix Verb URI Pattern                     Controller#Action
# external_validations GET /external_validations(.:format) external_validations#index
