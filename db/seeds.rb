# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'admin@admin.com',
    password: 'testtest',
)

Customer.create!(
  [
    {email: 'yamada@test.com', name: 'Yamada', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
    {email: 'tanaka@test.com', name: 'Tanaka', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
    {email: 'suzuki@test.com', name: 'Suzuki', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")},
    {email: 'kaneko@test.com', name: 'Kaneko', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")},
    {email: 'imai@test.com', name: 'Imai', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.png"), filename:"sample-user5.png")},
  ]
 )
 
  = Plan.create!(
  [
    {plan_title: '北海道２泊３日旅行', departure: '2022-07-01', arrival: '2022-07-03', days: '2', budget: '100000', count: '3', purpose_spot: '小樽、オルゴール堂、札幌二条市場、サーモンパーク千歳、さっぽろ羊ヶ丘展望台、札幌市時計台、さっぽろテレビ塔、白い恋人パーク', customer_id: customer[1].id },
  ]
 )