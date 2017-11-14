json.extract! fact, :id, :title, :body, :fact_id, :created_at, :updated_at
json.url fact_url(fact, format: :json)
