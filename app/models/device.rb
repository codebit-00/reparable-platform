# rubocop:disable Rails/HasAndBelongsToMany
class Device < ApplicationRecord
  has_and_belongs_to_many :stores

  validates :name, presence: true, uniqueness: true
end
# rubocop:enable Rails/HasAndBelongsToMany
