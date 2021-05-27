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
