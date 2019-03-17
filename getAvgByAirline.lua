local airlines = redis.call("KEYS","airline:*")
for i=1, table.getn(airlines) do
    
  local airline = airlines[i];
  local id = redis.call("HGET", airline, "id")
  local sum = tonumber(redis.call("GET", "sumDepdelay:" .. id))
  local cnt = tonumber(redis.call("GET","cntDepdelay:" .. id))
  redis.call("ZADD", "avgDepdelay", sum/cnt, airline)
end