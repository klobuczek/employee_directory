class PositionResource < ApplicationResource
  use_adapter JsonapiCompliable::Adapters::Null

  type :positions
  model Position

  allow_filter :title_prefix do |scope, value|
    scope.condition(:title).starts_with(value)
  end

  def resolve(scope)
    scope.query!
    scope.results
  end
end
