class CardsController < ApplicationController
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def show
    @card = Card.find(params[:id])
  end
  def create
    @card = Card.new(card_params)
    if
      @card.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
    @lists = List.where(user: current_user)
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
  @card = Card.find(params[:id])
  @card.destroy
  redirect_to :root
  end

  private
  def card_params
    params.require(:card).permit(:title,:memo,:list_id)
  end

end
