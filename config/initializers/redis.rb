$redis = Redis.new(host: 'localhost', port: 6379, driver: :hiredis)
# uri = URI.parse(ENV["REDISTOGO_URL"])
# $redis = Redis.new(:url => uri)
