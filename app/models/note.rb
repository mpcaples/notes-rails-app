class Note < ApplicationRecord
  has_many :note_tags, dependent: :delete_all
  has_many :tags, through: :note_tags

  def add_tag(name)
    tag = Tag.find_or_create_by(name: name.to_s.strip)
    tags << tag unless tags.include?(tag)
  end
end
