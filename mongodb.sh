source common.sh

print_head "Setup mongodb Repository"
cp ${code_dir}/configs/mongodb.repo /etc/yum.repos.d/mongo.repo &>>${log_file}

print_head "Install mongodb"
yum install mongodb-org -y &>>${log_file}

print_head "Update Mongodb Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/mongod.conf &>>${log_file}

print_head "Enable Mongodb"
systemctl enable mongod &>>${log_file}

print_head "Start Mongodb Service"
systemctl restart mongod &>>${log_file}

# Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf