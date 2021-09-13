class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(publication_id: params[:publication_id])
    redirect_to publications_path, notice: "#{favorite.publication.user.title}'S publication has been added to favorites"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to publications_path, notice: "#{favorite.publication.user.title}Unpublication Mr.'s publication"
  end

end
