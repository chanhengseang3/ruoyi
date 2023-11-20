## 安装步骤
### 1. 安装JDK和MySQL
- 安装OpenJDK17: https://www.rosehosting.com/blog/how-to-install-java-17-lts-on-ubuntu-20-04/
- 安装MySQL8: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04 (设置密码为：!QAZ1qaz)
- 安装Git: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04

### 2. 部署
1. Clone project from Git: 
```shell
git clone https://github.com/chanhengseang3/ruoyi.git
```
2. Run SQL script
```shell
cd sql
mysql -u root -p image_manage < image_manage.sql
```
3. Build Jar
```shell
./build.sh
```
4. Run
```shell
./run.sh
```
5. Verify
```
http://localhost
Default username: admin
Default password: admin123
```
