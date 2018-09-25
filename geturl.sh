#!/bin/bash
# curl -s:安靜模式 去除進度輸出
# awk -F 指定分割字元
# > NURL 將輸出結果存入NURL文件
curl -s "localhost:4040/api/tunnels" | awk -F',' '{print $3}' | awk -F'"' '{print $4}' | awk -F'//' '{print $2}' > NURL 
#以cat 指定讀取NURL並存入變數$NURL
NURL=`cat ./NURL`
#將$NURL寫入並輸出到./Chatbot_Line/code/secret_key
cat <<EOF > ./Chatbot_Line/code/secret_key
{
 "channel_access_token":"EqZij0pC4zUpvE6VlbjWR4ubX1P9pCfJJ92q5lXqfS20zHZW4yzDe7GBAyg1QnwpesaqGfgoon+MJZuzLsHMXDOYgcYa6kJ743LOIkO0czZrMqAhLs4GqROplGOI7dWOXhFqnThnNaXuOKZpoFDCXQdB04t89/1O/w1cDnyilFU=",
  "secret_key":"d15e6ab1a175c6fbba15d41bb464015d",
  "self_user_id":"Ua5ec88edae803461e0c943ef27a0312e",
  "rich_menu_id":"richmenu-68cb44af053d5cfb90aeaedc96bd306a",
  "server_url":"$NURL"
}
EOF
#刪除NURL
rm -f ./NURL
