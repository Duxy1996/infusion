class Assistance < ApplicationRecord
  has_many :reports, as: :reportable, dependent: :destroy
  belongs_to :user
  belongs_to :meetup
  validates  :review, length: {minimum: 5}, if: :should_validate?
  validates  :mark, numericality: {greater_than: -1, less_than_or_equal_to: 5}, if: :should_validate?

  def should_validate?
    not new_record?
  end
end
