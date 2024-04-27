Rails.application.routes.draw do
   root "home#index"

   get "/warehouses", to: "home#warehouses"

   get "/create_knight", to: "home#create_knight"

   get "/create_medusa", to: "home#create_medusa"

   get "/create_mage", to: "home#create_mage"

   get "/create_jinn", to: "home#create_jinn"

   get "/destroy_jinn", to: "home#destroy_jinn"

   get "/destroy_mage", to: "home#destroy_mage"

   get "/destroy_medusa", to: "home#destroy_medusa"

   get "/destroy_knight", to: "home#destroy_knight"

   post "/team1_ultimate", to: "home#team1_ultimate"

   post "/team2_ultimate", to: "home#team2_ultimate"
end
