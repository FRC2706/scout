class Objective < ApplicationRecord
  has_many :events
  has_many :autonomies

  after_initialize do
    self.year ||= Time.now.year
  end

  before_save do
    self.year = "1-1-#{year}".to_date
  end
end
