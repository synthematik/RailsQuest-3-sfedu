Rails.application.routes.draw do
   root "home#index"

   get "/create_knight", to: "home#create_knight"

   get "/create_medusa", to: "home#create_medusa"

   get "/create_mage", to: "home#create_mage"

   get "/create_jinn", to: "home#create_jinn"

   get "/destroy_jinn", to: "home#destroy_jinn"
end
