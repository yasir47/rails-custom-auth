class MainController < ApplicationController
  before_action :authenticate! , except: :register
  before_action :check_signed? , only: :register
  def index
    @user = current_user
  end

  def register
    if request.post?
      User.transaction do
        if params.present?
          user = User.create!(name: params[:register][:name] , password: params[:register][:password])
          if user.save
            session[:user_id] = user.id
            redirect_to root_path
          else
            redirect_to register_path
          end
        end
      end
    end
  end

end
