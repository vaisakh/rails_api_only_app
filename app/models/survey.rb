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

  # question_order - An array of Question IDs (as strings).
  # survey.question_order = ["10", "15", "14"]
  def question_order=(question_order)
    #questions.each do |question|
      #new_position = question_order.index(question.id.to_s)
      #next unless new_position
      #question.update(position: new_position)
    #end
  end

  # Survey.create
  # => #<Survey id:1, ..., slug:"KPzKP78G5vI93oxkX7cy"
  def generate_slug
    #self.slug = loop do
      #slug = SecureRandom.base64(4).tr('+/=', 'azyb')
      #break slug unless self.class.exists?(slug: slug)
    #end
  end
end
