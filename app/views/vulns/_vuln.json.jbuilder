json.extract! vuln, :id, :title, :description, :risk, :team, :reported_at, :days, :affected_asset, :status, :fixed_at, :comments, :reporter, :created_at, :updated_at
json.url vuln_url(vuln, format: :json)
