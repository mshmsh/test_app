json.array!(@orders) do |order|
  json.extract! order, :id, :order_date, :order_num, :pay_type
  json.url order_url(order, format: :json)
end
