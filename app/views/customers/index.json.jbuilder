json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :email, :address_1, :address_2, :birthday, :customer_num, :pay_type
  json.url customer_url(customer, format: :json)
end
