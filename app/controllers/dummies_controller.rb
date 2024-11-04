class DummiesController < ApplicationController
  before_action :find_dummy, only: %i[edit update show destroy]
  def index
    @dummies = Dummy.all
  end

  def new
    @dummy = Dummy.new
  end

  def create
    @dummy = Dummy.new(dummy_params)

    if @dummy.save
      redirect_to dummies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @dummy.update(dummy_params)
      redirect_to dummies_path, notice: "Dummy updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @dummy.destroy
    redirect_to dummies_path
  end

  private

  def find_dummy
    @dummy = Dummy.find(params[:id])
  end

  def dummy_params
    params.require(:dummy).permit(:name, :started_at, :completed_at, :active, :status)
  end
end
