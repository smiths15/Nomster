class Place < ActiveRecord::Base
end

def self.search(search)
  where("name ILIKE ? OR address ILIKE ? or description ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
end