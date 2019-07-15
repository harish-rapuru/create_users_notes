class Note < ActiveRecord::Base
  belongs_to :user
  has_many :note_tags
  has_many :tags, through: :note_tags

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, length: { maximum: 6000 }
  validates :user_id, presence: true

  scope :order_by_updated_at, -> { order(updated_at: :desc) }

  attr_writer :tags

  def tags=(objs)
    tags.delete_all unless tags.empty?

    objs.each do |obj|
      tags << Tag.find_or_create_by(name: obj) if obj.length > 0
    end
  end
end
