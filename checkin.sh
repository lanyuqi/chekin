echo '------------------sign------------------'
curl -H "cookie:${COOKIE}" -H 'content-type:application/json;charset=UTF-8' -d '{"token": "glados.network"}' -X POST 'https://glados.rocks/api/user/checkin' | grep -Eo '"message":"[^"]*"'
echo '-----------------status-----------------'
curl -H "cookie:${COOKIE}" -X GET 'https://glados.rocks/api/user/status' | grep -Eo '"leftDays":"[^"]*"'
# 获取签到信息
SIGN_MESSAGE=$(curl -H "cookie:${COOKIE}" -H 'content-type:application/json;charset=UTF-8' -d '{"token": "glados.network"}' -X POST 'https://glados.rocks/api/user/checkin' | grep -Eo '"message":"[^"]*"')

# 发送签到信息到Server酱，并打印响应
SERVER_RESPONSE=$(curl -X POST "https://sctapi.ftqq.com/${SCKEY}.send" -d "text=GLaDOS签到结果&desp=${SIGN_MESSAGE}")
echo "Server酱响应: $SERVER_RESPONSE"
