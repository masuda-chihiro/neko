class FilmsController < ApplicationController
 before_action :login_user
  def new
    @film = Film.new
  end

  def show
    @film = Film.find(params[:id])
  end

  def index
    @films = Film.paginate(page: params[:page])
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      flash[:success] = "Success!!"
      redirect_to @film
    else
      render 'new'
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update_attributes(film_params)
      flash[:success] = "Profile updated"
      redirect_to @film
    else
      render 'edit'
    end
  end
  def destroy
    Film.find(params[:id]).destroy
    flash[:success] = "Film deleted"
    redirect_to films_url
  end




  private 
  def film_params
    params.require(:film).permit(:title, :year, :director)
  end

  def login_user
    unless logged_in?
      flash[:danger] = "Log in please~"
      redirect_to login_path
    end
  end

end

