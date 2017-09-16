# Serializers define the rendered JSON for a model instance.
# We use jsonapi-rb, which is similar to active_model_serializers.
class SerializableList < JSONAPI::Serializable::Resource
  type :lists

  attribute :body

  belongs_to :list
end
