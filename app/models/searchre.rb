class Searchre
  include Mongoid::Document
  field :query, type: String
  field :title, type: String
  field :url, type: String
  field :keyword, type: String
end
