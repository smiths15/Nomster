class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photos
  geocoded_by :address
  after_validation :geocode
  validates :name, :address, :description, presence: true, length: {minimum: 3}
  def self.search(search)
    self.where("name ILIKE ? OR address ILIKE ? or description ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end