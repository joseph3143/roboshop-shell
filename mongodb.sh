source common.sh

print_head "Setup mongodb Repository"
cp configs/mongodb.repo /etc/yum.repos.d/mongo.repo

print_head "Install mongodb"
yum install mongodb-org -y

print_head "Enable Mongodb"
systemctl enable mongod

print_head "Start Mongodb Service"
systemctl start mongod

# Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf