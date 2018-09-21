# Chatbot_Project
:dog:  
* 9/6 新增  
於Chatbot_Project下掛載兩個repo  
分別為Chatbot_Line及Chatbot_Dev
* 9/13 更新  
將Chatbot_Line及Chatbot_Dev更新為最新狀態  

* 9/15
將所有container整合打包
apiserver對外端口為5001

* 9/17
更改docker-compose image來源

* 9/19
新增codebuild腳本&所需文件
更新submodule到最新master
新增getip.sh 於EC2開啟後自動執行抓取EC2 ip 存入文件ip.env
更新docker compose ：
    LINE_API 抓取ip.env文件導入環境變數
    開啟command	改為直接執行python檔test.py

