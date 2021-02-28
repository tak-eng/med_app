class Idea < ApplicationRecord
  acts_as_taggable

  validates :idea, presence: true
end
