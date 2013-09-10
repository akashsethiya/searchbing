class Searchre
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :query, type: String
  field :title, type: String
  field :url, type: String
  field :keyword, type: String
end
