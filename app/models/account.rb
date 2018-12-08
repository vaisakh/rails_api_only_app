class Account < ApplicationRecord
  RESTRICTED_SUBDOMAIN = %w(www app dev api)

  belongs_to :owner, class_name: 'User', dependent: :destroy

  validates :owner, presence: true
  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid charecters' },
                        exclusion: { in: RESTRICTED_SUBDOMAIN, message: 'restricted' }

  accepts_nested_attributes_for :owner, allow_destroy: true

  before_validation :downcase_subdomain
  validates_presence_of :company
  validates :subdomain, uniqueness: true

  private
  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
