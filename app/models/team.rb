class Team < ApplicationRecord
  has_many :vulns

  validates :name, presence: true

  default_scope { order(name: :asc) }

  def self.data_table_columns
    {
      name: :name
    }
  end

  def data_table_row
    {
      name: name
    }
  end
end
