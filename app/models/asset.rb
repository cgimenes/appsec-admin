class Asset < ApplicationRecord
  validates :name, presence: true

  default_scope {order(name: :asc)}

  def data_table_row
    {:name => name}
  end

  def self.data_table_columns
    {:name => false}
  end
end
