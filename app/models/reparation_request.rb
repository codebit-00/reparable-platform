class ReparationRequest < ApplicationRecord
  STATUSES = %i[pending approved rejected].freeze

  belongs_to :store

  validates :device, :purchase_installation_date, :issue_description, :model_number,
            :requester_zip_code, :requester_address, :requester_first_name, :requester_last_name,
            :requester_email, :requester_telephone, :requester_country, :requester_state,
            :requester_city, presence: true
  validates :requester_first_name, :requester_last_name,
            format: { with: /\A[a-zA-Z']+\z/,
                      message: 'only allow letters' }
  validates :requester_email,
            format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                      message: 'your@mail.com format is required' }
  validates :requester_telephone, numericality: { only_integer: true,
                                                  message: 'only allow numbers' }
  validates :issue_description,
            length: { maximum: 1000,
                      message:
                      'length should be have 1000 characters as maximum' }
  validate :validate_purchase_installation_date

  private

  def validate_purchase_installation_date
    return true if purchase_installation_date.nil?

    return unless purchase_installation_date > Time.zone.today

    errors.add(:purchase_installation_date, 'can not be in the future')
  end
end
