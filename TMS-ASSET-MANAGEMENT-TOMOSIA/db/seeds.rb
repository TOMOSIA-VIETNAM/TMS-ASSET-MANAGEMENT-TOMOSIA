Project.create!(
  name: "name ",created_at: Time.zone.now, updated_at: Time.zone.now
)
2.times do |n|
  name = Faker::Name.name
  Project.create!(name: name, created_at: Time.zone.now, updated_at: Time.zone.now)
end

User.create!(name: "name user",
  email: "example@gmail.com", password:"foobar", password_confirmation: "foobar", role: 1, phone_number: '0123456789', project_id: 1, created_at: Time.zone.now, updated_at: Time.zone.now)
50.times do |n|
  name = Faker::Name.name
  email = "examples-#{n+1}@gmail.com"
  password = "password"
  role = Random.rand(1..3)
  phone_number = Faker::PhoneNumber.phone_number
  project_id = 1
  User.create!(
    name: name,
    email: email,
    password:password,
    password_confirmation: password,
    role: role, phone_number: phone_number,
    project_id: project_id,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

users = User.order(:created_at).take(3)
2.times do |n|
  type_request = "muon thiet bi"
  reason = "dang mua hang"
  status = Random.rand(1..3)
  item_id = "#{n+1}"
  users.each { |user| user.requests.create!(type_request: type_request,reason: reason, status: status, item_id: item_id ) }
end

requests = Request.order(:created_at).take(2)
2.times do
  name = Faker::Name.name
  status = Random.rand(1..3)
  category_id = "#{n+1}"
  provider_id = "#{n+1}"
  comment = "san pham tot"
  price = 900
  tag_search = ["key#{n}" => "value#{n}"]
  detail = "thong tin thiet bi"

  requests.each { |request| request.items.create!(
    name: name,
    status: status,
    comment:comment,
    price: price,
    provider_id: provider_id,
    category_id: category_id,
    tag_search: tag_search,
    detail: detail
  ) }
end

# Item.create!(name: "name user",
#   status: 1, comment: "san pham khong tot", price: 900, tag_search: ["key" => "value"], detail:"thong tin thiet bi", category_id: 1,provider_id: 1,
#   created_at: Time.zone.now, updated_at: Time.zone.now)
# 50.times do |n|
#   name = Faker::Name.name
#   status = Random.rand(1..3)
#   category_id = "#{n+1}"
#   provider_id = "#{n+1}"
#   comment = "san pham tot"
#   price = 900
#   tag_search = ["key#{n}" => "value#{n}"]
#   detail = "thong tin thiet bi"
#   Item.create!(
#     name: name,
#     status: status,
#     comment:comment,
#     price: price,
#     provider_id: provider_id,
#     category_id: category_id,
#     tag_search: tag_search,
#     detail: detail,
#     created_at: Time.zone.now,
#     updated_at: Time.zone.now
#   )
# end

Deliver.create!(type_deliver: "tra thiet bi",
  status: 1, reason:"dang xu ly", request_id:1 , item_id: 1, start_date: Time.zone.now, end_date: Time.zone.now,  created_at: Time.zone.now, updated_at: Time.zone.now)
2.times do |n|
  type_deliver = "muon thiet bi",
  reason = "dang mua hang"
  status = Random.rand(1..3)
  request_id = "#{n+2}"
  item_id = "#{n+2}"

  Deliver.create!(
    type_deliver: type_deliver,
    reason: reason,
    request_id: request_id,
    item_id: item_id,
    status: status,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

Provider.create!(name: "name user",
  address: "110 tran cao van, TP da nang", phone_number: "0774578782", delegate:"Tran Van B", created_at: Time.zone.now, updated_at: Time.zone.now)
2.times do |n|
  name = Faker::Name.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  delegate = "Tran Van B"
  Provider.create!(
    name: name,
    address: address,
    phone_number: phone_number,
    delegate: delegate,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

Category.create!(name: "name user",
  quantity: 800, status: 1, created_at: Time.zone.now, updated_at: Time.zone.now)
2.times do |n|
  name = Faker::Name.name
  quantity = 900
  status = Random.rand(1..3)
  Category.create!(
    name: name, 
    quantity: quantity, 
    status: status,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end
