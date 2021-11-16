class ActivitiesSerializer
  include JSONAPI::Serializer

  # set_id :null
  set_type :activities
  attributes :destination, :forecast, :activities
end
