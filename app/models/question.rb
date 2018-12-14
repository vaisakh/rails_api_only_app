class Question < ApplicationRecord

TYPES = %w(
    openion_scale
    multiple_choice
    picture_choice
    rating
    yes_or_no
    text
    number
    email
    message
    upload
  )

  # Associations
  belongs_to :survey, dependent: :destroy
  has_many :answers, dependent: :destroy

  # Validations
  validates :survey, presence: true
  validates :title, length: { in: 0..255 }, allow_nil: false
  validates :q_type, presence: true, inclusion: { in: TYPES }
end
