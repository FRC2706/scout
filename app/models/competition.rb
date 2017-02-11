class Competition < ApplicationRecord
  has_many :matches
  has_many :teams

  validates :name, presence: true
  validates :tba_code, presence: true
  validates :tba_code, uniqueness: true

  after_initialize do
    self.year ||= Time.now.year
  end

  before_save do
    self.year = "1-1-#{year}".to_date
  end
end
