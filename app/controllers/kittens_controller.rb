class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render }
    end
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten successfully created"
      redirect_to @kitten
    else
      flash.now[:danger] = "Something wrong"
      render :new
    end
  end

  def update
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Successfully updated"
      redirect_to @kitten
    else
      flash.now[:danger] = "Couldn't update"
      render :edit
    end
  end

  def destroy
    if @kitten.destroy
      flash[:success] = "Kitten was deleted"
    else
      flash[:danger] = "Unsuccessful"
    end
    redirect_to kittens_path
  end


  private


    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

    def set_kitten
      @kitten = Kitten.find(params[:id])
    end
end
