cat init-airlines.txt | redis-cli --pipe
cat sumDelay.txt | redis-cli --pipe; && \
cat cntDelay.txt | redis-cli --pipe;

redis-cli --eval getAvgByAirline.lua

ZRANGE avgDepdelay 0 -1 WITHSCORES
ZRANGEBYSCORE avgDepdelay -10 10 WITHSCORES
