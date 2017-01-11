Git global setup

git config --global user.name "임대현"
git config --global user.email "daihyun99@gmail.com"

Create a new repository

git clone git@gitlab.com:daihyun99/hotplacemaker.git
cd hotplacemaker
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

Existing folder or Git repository

cd existing_folder
git init
git remote add origin git@gitlab.com:daihyun99/hotplacemaker.git
git add .
git commit
git push -u origin master