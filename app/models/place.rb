class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, :address, :description, presence: true, length: {minimum: 3}
  def self.search(search)
    self.where("name ILIKE ? OR address ILIKE ? or description ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end