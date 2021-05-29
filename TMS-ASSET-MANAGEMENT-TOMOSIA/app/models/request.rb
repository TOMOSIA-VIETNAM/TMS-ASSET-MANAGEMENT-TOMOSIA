class Request < ApplicationRecord
  extend Enumerize
  WEBHOOK_URL = 'https://hooks.slack.com/services/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'
  
  belongs_to :user
  belongs_to :item
  has_one :deliver

  enumerize :status, :in => {
    pending: 0,
    approve: 1,
    reject: 2
  }

  enumerize :type_request, :in => {
    Borrow: 0,
    Restore: 1,
    Break: 2
  }

  validates :reason, :start_date, :end_date, presence: true

  def self.search(term)
    if term
      where('type_request LIKE ?', "%#{term}%")
    else
      all
    end

  end

  scope :status_pending, -> {where status: 'pending'}
  scope :status_approve, -> {where status: 'approve'}

end
