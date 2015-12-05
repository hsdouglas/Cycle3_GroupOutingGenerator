json.array!(@credit_cards) do |credit_card|
  json.extract! credit_card, :id, :name, :type, :number, :expiration_month, :expiration_year, :zipcode
  json.url credit_card_url(credit_card, format: :json)
end
