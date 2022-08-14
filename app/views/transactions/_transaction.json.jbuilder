json.extract! transaction, :id, :date, :description, :transaction_value, :transaction_type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
