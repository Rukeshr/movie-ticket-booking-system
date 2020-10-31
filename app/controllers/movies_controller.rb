class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all
    if params[:search]
      @search_term = params[:search]
      @movies = @movies.search_by(@search_term)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:movie_title, :director, :actors, :movie_type, :image, :language, :show_time))
    if @movie.save
    flash[:notice] = "Movie added successfully."
    redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(params.require(:movie).permit(:movie_title, :director, :actors, :movie_type, :image, :language, :show_time))
      flash[:notice] = "Movie was updated successfully."
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end
end
