RailsAdmin.config do |config|

  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user && current_user.admin
  end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    list do
      field :name
      field :email
      field :sign_in_count
    end

  end

  config.model 'Booking' do
    edit do
      # field :greeter, :enum do
      #   enum do

      #     User.all.collect {|p| ["#{p.name.to_s} (#{p.sign_in_count})", p]}

      #   end

      # end
      field :greeter
      field :visitor
      field :date
      field :aasm_state, :enum do
        enum do
          Booking.aasm.states.map(&:name)
        end

      end
      field :aasm_state do
        label "Status"
      end
    end

    list do
      field :greeter
      field :visitor
      field :date
      field :aasm_state do
        label "Status"
      end
    end
  end
end
