json.array!(@orders) do |order|
  json.extract! order, :id, :name, :address, :email, :typeOfPayment
  json.url order_url(order, format: :json)
end
