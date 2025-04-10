class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find_by(email: 'anonymous@example.com')
    
    if @gossip.save
      redirect_to gossips_path, notice: 'Potin creer avec succès !' 
    else
      render :new
    end
  end

  private
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
  
  def authenticate_user
    redirect_to new_session_path, alert: 'Vous devez être connecté pour effectuer cette action.' unless current_user
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = @gossip.comments.build
  end
end
  def edit
    @gossip = Gossip.find(params[:id])
    render :edit
  end

  def update
    @gossip = Gossip.find(params[:id])
  if @gossip.update(gossip_params)
    redirect_to @gossip, notice: 'Le potin a été mis à jour avec succès !'
  end
end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: 'Le potin a été supprimé avec succès !'
  end
