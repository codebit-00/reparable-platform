# rubocop:disable Rails/HasAndBelongsToMany
class Store < ApplicationRecord
  has_many :reparation_requests, dependent: :destroy
  has_many :users, dependent: :destroy
  has_and_belongs_to_many :devices

  validates :priority,
            presence: true,
            uniqueness: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :address, presence: true
end
# rubocop:enable Rails/HasAndBelongsToMany
