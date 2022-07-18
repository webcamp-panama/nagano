class Admin::GenresController < ApplicationController
  def index
     @admin = current_admin
     @genres = Genre.all
     @genre = Genre.new
  end

  def create
     @genres = Genre.all
     @genre = Genre.new(genre_params)
     @genre.admin_id = current_admin.id
     if @genre.save
       redirect_to admin_genres_path(@genre)
     else
       render :index
     end
  end

  def edit
     @genre = Genre.find(params[:id])
  end


  def update
     @genre = Genre.find(params[:id])
     if @genre.update(genre_params)
       redirect_to admin_genre_path(@genre)
     else
        render :edit
     end
  end


  def genre_params
    params.permit(:name)
  end


end
