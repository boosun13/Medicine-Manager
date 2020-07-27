json.extract! prescription, :id, :start_time, :visit_date, :hospital, :doctor, :pharmacy, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
