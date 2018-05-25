class AnalyticFootball < Analytic
	validates :record_id, presence: true, uniqueness: { scope: [:user_id, :ip_address] },allow_nil: true
end