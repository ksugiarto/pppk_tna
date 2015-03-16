PppkTna::Application.routes.draw do
  resources :teacher_answer_details
  resources :teacher_answers

  resources :report do
    collection do
      get :event
      get :event_filter
    end
  end

  resources :filter do
    collection do
      get :city
      get :school
      get :teacher
      get :event
      get :event_check_request
      get :participant_check_all
      get :participant_checked
    end
  end

  resources :events do
    resources :event_matters
    resources :event_prerequisites

    resources :event_exams do
      resources :questions do
        collection do
          get :pick_subject
          get :peek_indicator
          get :export_ans_sheet
          get :import_ans_sheet
          post :import_submit_ans_sheet
        end
      end

      member do
        get :print_exam_pdf
      end
    end

    resources :event_participants do
      collection do
        get :check_request
        get :check_all
        get :checked
        get :checked_email
        get :send_invitation
        get :print_invitation
        get :pick_participant
        get :register_participant
        post :fix_participant

        get :review_participant
      end
    end

    collection do
      get :check_request #step 1
      get :check_request_next
    end

    member do
      get :pick_date #step 2
      get :save_date
      get :pick_vocational #step 3
      get :save_vocational
      get :entry_information #step 4
    end
  end

  resources :teachers do
    resources :teacher_vocationals
    resources :teacher_histories
    resources :teacher_subjects do
      resources :teacher_subject_details
    end
  end

  resources :schools do
    resources :school_vocationals
    resources :school_requests do
      resources :request_participants
      resources :request_vocationals
    end

    collection do
      get :import
      post :import_submit
    end
  end

  resources :curicculums do
    resources :vocationals do
      resources :core_competencies do
        resources :basic_competencies do
          resources :subjects
        end
      end
    end
  end

  resources :cities do
    collection do
      get :import
      post :import_submit
    end
  end

  resources :user_groups
  devise_for :users
  scope "/admin" do
    resources :users
  end
  
  resources :provinces
  resources :countries
  resources :important_people
  resources :company_profiles

  get "home/index"
  # get "*module/home/provinces_by_country" => "home#provinces_by_country"
  # get "*module/home/cities_by_province" => "home#cities_by_province"
  get "home/provinces_by_country" => "home#provinces_by_country"
  get "home/cities_by_province" => "home#cities_by_province"
  
  root to: "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
