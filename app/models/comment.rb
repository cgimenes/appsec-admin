class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vuln

  validates :body, presence: true
end
