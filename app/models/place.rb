class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  def self.search(search)
    self.where("name ILIKE ? OR address ILIKE ? or description ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end