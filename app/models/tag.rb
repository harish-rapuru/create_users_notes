class Tag < ActiveRecord::Base
  has_many :note_tags
  has_many :notes, through: :note_tags
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
end
