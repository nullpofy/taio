class Content
  include Mongoid::Document
  field :key, :type => String
  field :val, :type => String
  embedded_in :collection
end
