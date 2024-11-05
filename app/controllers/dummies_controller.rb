class DummiesController < BaseController
  def create
    @dummy = Dummy.new(dummy_params)

    if @dummy.save
      respond_to do |format|
        format.html { redirect_to dummies_path, notice: "Dummy created successfully" }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dummy.update(dummy_params)
      respond_to do |format|
        # format.html { redirect_to dummies_path }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dummy.destroy
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
