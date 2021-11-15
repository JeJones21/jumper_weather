class ActivitiesSerializer
  include JSONAPI::Serializer

  set_id :nil
  set_type :activities
  attributes :title, :type, :participants, :price
end
