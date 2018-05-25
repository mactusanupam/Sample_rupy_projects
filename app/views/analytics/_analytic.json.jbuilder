json.extract! analytic, :id, :type, :view_count, :vote_count, :ip_address, :session_hash, :created_at, :updated_at
json.url analytic_url(analytic, format: :json)
