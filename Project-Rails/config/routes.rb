Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'petshelter#events'
  get  'animals' => 'petshelter#animals'
  get  'animals/:species' => 'petshelter#animals'
  get  'animal/:species/:animal_id' => 'petshelter#animal'
  get  'animal/:species/:animal_id/:file_id' => 'petshelter#animal_file'
  get  'shelters' => 'petshelter#shelters'
  get  'shelter/:shelter_id' => 'petshelter#shelter'
  get  'staffs' => 'petshelter#staffs'
  get  'staff/:staff_id' => 'petshelter#staff'
  get  'users' => 'petshelter#users'
  get  'user/:user_id' => 'petshelter#user'
  get  'activities/receipts' => 'petshelter#act_receipts'
  get  'activities/receipt/:receipt_id' => 'petshelter#act_receipt'
  get  'activities/adoptions' => 'petshelter#act_adoptions'
  get  'activities/adoption/:adoption_id' => 'petshelter#act_adoption'
  get  'activities/surrenders' => 'petshelter#act_surrenders'
  get  'activities/surrender/:surrender_id' => 'petshelter#act_surrender'
  get  'activities/donations' => 'petshelter#act_donations'
  get  'activities/donation/:donation_id' => 'petshelter#act_donation'
  get  'activities/volunteers' => 'petshelter#act_volunteers'
  get  'activities/volunteer/:volunteer_id' => 'petshelter#act_volunteer'
  get  'applications/adopt' => 'petshelter#app_adopt'
  post 'applications/adopt' => 'petshelter#app_adopt'
  get  'applications/surrender' => 'petshelter#app_surrender'
  post 'applications/surrender' => 'petshelter#app_surrender'
  get  'applications/donate' => 'petshelter#app_donates'
  post 'applications/donate' => 'petshelter#app_donates'
  get  'applications/donate/:donate_type' => 'petshelter#app_donate'
  post 'applications/donate/:donate_type' => 'petshelter#app_donate'
  get  'applications/volunteer' => 'petshelter#app_volunteer'
  post 'applications/volunteer' => 'petshelter#app_volunteer'
  get  'login' => 'petshelter#login'
  get  'management' => 'petshelter#management'
  get  'management/receive' => 'petshelter#man_receive'
  post 'management/receive' => 'petshelter#man_receive'
  get  'management/shelters' => 'petshelter#man_shelters'
  post 'management/shelters' => 'petshelter#man_shelters'
  get  'management/shelter/:shelter_id' => 'petshelter#man_shelter'
  post 'management/shelter/:shelter_id' => 'petshelter#man_shelter'
  get  'management/staffs' => 'petshelter#man_staffs'
  post 'management/staffs' => 'petshelter#man_staffs'
  get  'management/staff/:staff_id' => 'petshelter#man_staff'
  post 'management/staff/:staff_id' => 'petshelter#man_staff'
  get  'management/requests' => 'petshelter#man_requests'
  post 'management/requests' => 'petshelter#man_requests'
  get  'management/requests/adoptions' => 'petshelter#man_req_adoptions'
  post 'management/requests/adoptions' => 'petshelter#man_req_adoptions'
  get  'management/requests/adoption/:adoption_id' => 'petshelter#man_req_adoption'
  post 'management/requests/adoption/:adoption_id' => 'petshelter#man_req_adoption'
  get  'management/requests/surrenders' => 'petshelter#man_req_surrenders'
  post 'management/requests/surrenders' => 'petshelter#man_req_surrenders'
  get  'management/requests/surrender/:surrender_id' => 'petshelter#man_req_surrender'
  post 'management/requests/surrender/:surrender_id' => 'petshelter#man_req_surrender'
  get  'management/requests/donations' => 'petshelter#man_req_donations'
  post 'management/requests/donations' => 'petshelter#man_req_donations'
  get  'management/requests/donation/:donation_id' => 'petshelter#man_req_donation'
  post 'management/requests/donation/:donation_id' => 'petshelter#man_req_donation'
  get  'management/requests/volunteers' => 'petshelter#man_req_volunteers'
  post 'management/requests/volunteers' => 'petshelter#man_req_volunteers'
  get  'management/requests/volunteer/:volunteer_id' => 'petshelter#man_req_volunteer'
  post 'management/requests/volunteer/:volunteer_id' => 'petshelter#man_req_volunteer'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
