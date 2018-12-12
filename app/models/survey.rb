class Survey < ApplicationRecord

  # Validations
  validates :title, presence: :true

  # Associations
  has_many :questions, dependent: :destroy

  # Callbacks
  before_validation :set_default_title, on: :create

  accepts_nested_attributes_for :questions, allow_destroy: true

  def set_default_title
    self.title = "Untitled survey" if title.blank?
  end
end
