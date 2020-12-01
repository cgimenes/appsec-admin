class User < ApplicationRecord
  extend Enumerize
  enumerize :role, in: [:admin, :appsec, :guest]

  devise :database_authenticatable, :registerable

  default_scope { order(fullname: :asc) }

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: true

  def self.data_table_columns
    {
        :email => :email,
        :fullname => :fullname,
        :role => :role
    }
  end

  def data_table_row
    {
        email: email,
        fullname: fullname,
        role: role&.humanize
    }
  end
end
