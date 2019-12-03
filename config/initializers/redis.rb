#redis连接
$redis0 = Redis.new(:host => 'localhost', :port => 6379, db: 0)
$redis1 = Redis.new(:host => 'localhost', :port => 6379, db: 1)
$redis2 = Redis.new(:host => 'localhost', :port => 6379, db: 2)
$redis3 = Redis.new(:host => 'localhost', :port => 6379, db: 3)