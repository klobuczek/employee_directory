class ListsController < ApplicationController
  # Mark this as a JSONAPI controller, associating with the given resource
  jsonapi resource: ListResource

  # Reference a strong resource payload defined in
  # config/initializers/strong_resources.rb
  strong_resource :list

  # Run strong parameter validation for these actions.
  # Invalid keys will be dropped.
  # Invalid value types will log or raise based on the configuration
  # ActionController::Parameters.action_on_invalid_parameters
  before_action :apply_strong_params, only: [:create, :update]

  # Start with a base scope and pass to render_jsonapi
  def index
    lists = List.all
    render_jsonapi(lists)
  end

  # Call jsonapi_scope directly here so we can get behavior like
  # sparse fieldsets and statistics.
  def show
    scope = jsonapi_scope(List.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end

  # jsonapi_create will use the configured Resource (and adapter) to persist.
  # This will handle nested relationships as well.
  # On validation errors, render correct error JSON.
  def create
    list, success = jsonapi_create.to_a

    if success
      render_jsonapi(list, scope: false)
    else
      render_errors_for(list)
    end
  end

  # jsonapi_update will use the configured Resource (and adapter) to persist.
  # This will handle nested relationships as well.
  # On validation errors, render correct error JSON.
  def update
    list, success = jsonapi_update.to_a

    if success
      render_jsonapi(list, scope: false)
    else
      render_errors_for(list)
    end
  end

  # No need for any special logic here as no_content is jsonapi_compliant.
  # Customize this if you have a more complex use case.
  def destroy
    list = List.find(params[:id])
    list.destroy
    return head(:no_content)
  end
end
