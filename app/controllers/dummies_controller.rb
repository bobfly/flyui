class DummiesController < ApplicationController
  before_action :find_dummy, only: %i[edit update show destroy]
  before_action :find_filters_count, only: %i[index]

  def index
    @q = Dummy.ransack(params[:q])
    @pagy, @dummies = pagy(@q.result.distinct)
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

  def find_filters_count
    return @filter_count = 0 if params[:q].blank?

    permitted_params = params.require(:q).permit(:name_cont, :status_eq, :active_eq, :date_range)
    @filter_count = permitted_params.to_h.reject { |_, value| value.blank? }.count
  end

  def dummy_params
    params.require(:dummy).permit(:name, :started_at, :completed_at, :active, :status)
  end
end
