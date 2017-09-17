require 'redis'
require 'redis/objects'

redis = Redis.new
Redis::Objects.redis = redis