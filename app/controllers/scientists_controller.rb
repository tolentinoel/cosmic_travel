class ScientistsController < ApplicationController

  def index
    @scientists = Scientist.all
  end

  def show
    get_scientist
  end


  def new
    @scientist = Scientist.new
  end


  def edit
    get_scientist
  end


  def create
    @scientist = Scientist.new(scientist_params)

        if @scientist.valid?
            @scientist.save
            redirect_to scientist_path(@scientist)
        else
            render :new
        end
  end

  # PATCH/PUT /scientist/1
  # PATCH/PUT /scientist/1.json
  def update
    get_scientist
     @scientist.update(scientist_params)
     if @scientist.save
        redirect_to scientist_path(@scientist)
     else
        render :edit
    end
  end

  # DELETE /scientist/1
  # DELETE /scientist/1.json
  def destroy
    get_scientist
    @scientist.destroy
    redirect_to scientists_path
  end

  private

  def get_scientist
    @scientist = Scientist.find(params[:id])
  end

  def scientist_params
    params.require(:scientist).permit(:name, :field_of_study)
  end

end