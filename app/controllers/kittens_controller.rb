class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index 
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @kittens }
      format.json { render json: @kittens }
    end
  end

  def show
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @kitten }
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "New kitten created!"
      redirect_to kittens_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten modified!"
      redirect_to kittens_path
    else
      render :new
    end
  end

  def destroy
    @kitten.destroy
    flash[:notice] = "Kitten deleted!"
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
