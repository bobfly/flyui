class DummiesController < BaseController
  def create
    @resource = Dummy.new(dummy_params)

    if @resource.save
      redirect_to dummies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(dummy_params)
      redirect_to dummies_path, notice: "Dummy updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to dummies_path
  end

  private

  # Define the filterable attributes for Ransack in the context of Dummies
  def filterable_attributes
    %i[name_cont status_eq active_eq date_range]
  end

  def dummy_params
    params.require(:dummy).permit(:name, :started_at, :completed_at, :active, :status)
  end

  def resource_class
    Dummy
  end
end
