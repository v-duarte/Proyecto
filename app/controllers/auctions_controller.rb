class AuctionsController < ApplicationController

  def index
    @auction = Auction.all
  end

  def show
    @auction = Auction.find(params[:id]) #Asigna la subasta id a la variable subasta
    @user = User.new
  end

  def destroy            #elimina una residencia de la base de datos
      @auction = Auction.destroy(params[:id])
      redirect_to auctions_path
    end

  def new
    @auction = Auction.new #Creo una nueva subasta
  end

  def create
    @auction = Auction.new(params.require(:auction).permit(:residence_id, :maxbid))

    if @auction.save
      redirect_to auctions_path, notice: "Se creo la subasta exitosamente."  #redirecciono a la pagina de subastas
    else
      render :new
    end
  end

  def update
    @user = User.new(params.require(:user).permit(:email, :password))
    #@user.credits -= 1
    @user.save

    @auction = Auction.new(params.require(:auction).permit(:residence_id, :maxbid))
    @auction.save
  end

end
