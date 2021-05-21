User.create!(name: "name user",
    email: "example@gmail.com", password:"foobar", password_confirmation: "foobar", role: 1, phone_number: '0123456789', project_id: 1, created_at: Time.zone.now, updated_at: Time.zone.now)
  50.times do |n|
    name = Faker::Name.name
    email = "examples-#{n+1}@gmail.com"
    password = "password"
    role = Random.rand(0..2)
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

  Item.create!(name: "name user",
    status: 1, comment: "hang chat luong", price: 900, tag_search: ["key"=> "value"], detail: "thoong tin sp ", category_id: 1, created_at: Time.zone.now, updated_at: Time.zone.now)
  50.times do |n|
    name = Faker::Name.name
    status = Random.rand(0..2)
    price = 900
    tag_search = ["key#{n+2}"=> "value#{n+2}"]
    detail = "thong tin sp"
    category_id = Random.rand(1..10)
    # buyer_id = 2
    Item.create!(
      name: name,
      status: status,
      price: price,
      tag_search: tag_search,
      detail: detail,
      category_id: category_id,
    #   buyer_id: buyer_id,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    )
  end

users = User.order(:created_at).take(3)
51.times do
#   content = Faker::Lorem.sentence(word_count: 5)
    type_request = "muon thiet bi",
    reason = "dang mua hang",
    status = Random.rand(0..2),
    item_id = Random.rand(1..51)
    start_day =  Time.zone.now
    end_day =  Time.zone.now
    users.each { |user| user.requests.create!(type_request: type_request,reason: reason, status: status, item_id: item_id, start_date: start_day, end_date: end_day) }
end
