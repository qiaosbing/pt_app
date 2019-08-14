# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#用户信息
[
    { "user_id" => "1", "user_name" => "乔帅兵", "phone" => "13014721444","mailbox" => "2926745595@qq.com", "units" => "河南省汇智丰科技有限公司","remark" => "英俊潇洒，风流倜傥，才高八斗，学赋五车，貌比潘安宋玉，德堪柳下惠，人见人爱，一支梨花压海棠。"},
    { "user_id" => "2", "user_name" => "薛欣", "phone" => "18338194720","mailbox" => "*****", "units" => "家里蹲科技股份有限公司","remark" => "心灵美，才是真的美！"}
].each do |level|
  UserDesc.create(level)
end