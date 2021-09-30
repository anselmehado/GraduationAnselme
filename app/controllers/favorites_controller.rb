class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

  end

  def create
    favorite = current_user.favorites.create(publication_id: params[:publication_id])
    redirect_to publications_path, notice: "#{favorite.publication.title}'S publication has been added to favorites"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to publications_path, notice: "#{favorite.publication.title}Unpublication Mr.'s publication"
  end

end
