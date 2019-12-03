#redis连接
# 连接第一个库
$redis0 = Redis.new(:host => 'localhost', :port => 6379, db: 0)