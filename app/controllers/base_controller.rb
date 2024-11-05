class BaseController < ApplicationController
  before_action :find_resource, only: %i[edit show update destroy]
  before_action :find_filters_count, only: %i[index]

  def index
    @q = resource_class.ransack(params[:q])
    @pagy, @resources = pagy(@q.result(distinct: true))
    instance_variable_set("@#{controller_name}", @resources)
  end

  def new
    instance_variable_set("@#{resource_name}", resource_class.new)
  end

  def edit; end

  def show; end

  private

  def resource_name
    resource_class.model_name.element
  end

  def resource_class
    raise NotImplementedError, "Please define #resource_class in #{self.class.name}"
  end

  def find_resource
    instance_variable_set("@#{resource_name}", resource_class.find(params[:id]))
  end

  def find_filters_count
    return @filter_count = 0 if params[:q].blank?

    permitted_params = params.require(:q).permit(filterable_attributes)
    @filter_count = permitted_params.to_h.reject { |_, value| value.blank? }.count
  end

  # Define the filterable attributes for Ransack
  def filterable_attributes
    []
  end
end
