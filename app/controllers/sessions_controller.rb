class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connexion réussie !'
    else
      flash.now[:alert] = 'Identifiants invalides'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Déconnexion réussie !'
  end
end
<%= link_to 'Déconnexion', logout_path, method: :delete %>

