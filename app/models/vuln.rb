class Vuln < ApplicationRecord
  extend Enumerize

  has_paper_trail on: [:update, :destroy], ignore: [:updated_at]

  belongs_to :team
  belongs_to :affected_asset, foreign_key: 'affected_asset_id', class_name: 'Asset'
  belongs_to :reporter, foreign_key: 'reporter_id', class_name: 'User'

  has_many :comments, dependent: :delete_all

  enumerize :risk, in: [:critical, :high, :medium, :low, :info]
  enumerize :status, in: [:pending, :fixed, :accepted, :incomplete_data]

  validates :title, presence: true
  validates :description, presence: true
  validates :risk, presence: true
  validates :team_id, presence: true
  validates :reported_at, presence: true
  validates :affected_asset_id, presence: true
  validates :status, presence: true

  def days
    ((fixed_at || Date.today) - reported_at).to_i
  end

  def self.data_table_columns
    {
      id: :id,
      title: :title,
      description: false,
      risk: :risk,
      team: :team_name,
      reported_at: :reported_at,
      status: :status,
      days: false,
      affected_asset: false,
      fixed_at: :fixed_at
    }
  end

  def data_table_row
    {
      id: id,
      title: title,
      description: description,
      risk: risk,
      team: team.name,
      reported_at: reported_at,
      status: status,
      days: days,
      affected_asset: affected_asset.name,
      fixed_at: fixed_at
    }
  end
end
