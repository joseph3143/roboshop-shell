code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm -f ${log_file}

echo -e "\e[33mInstalling nginx\e[0"
yum install nginx -y &>>${log_file}

echo -e "\e[33mRemoving Old Content\e[0"
rm -rf /usr/share/nginx/html/* &>>${log_file}

echo -e "\e[33mDownloading Frontend Content\e[0"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log_file}

echo -e "\e[33mExtracting Downloaded Frontend\e[0"
cd /usr/share/nginx/html &>>${log_file} &>>${log_file}
unzip /tmp/frontend.zip &>>${log_file}

echo -e "\e[33mCopying Nginx Config for Roboshop\e[0"
cp configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop/conf &>>${log_file}

echo -e "\e[33mEnabling nginx\e[0"
systemctl enable nginx &>>${log_file}

echo -e "\e[33mStarting nginx\e[0"
systemctl restart nginx &>>${log_file}



