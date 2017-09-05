class AuthorsController < ApplicationController

  def index
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    binding.pry

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end






  def show
    @author = Author.find(params[:id])
  end


  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
