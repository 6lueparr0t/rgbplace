Git global setup\n\n

git config --global user.name "임대현"\n
git config --global user.email "daihyun99@gmail.com"\n\n

Create a new repository\n\n

git clone git@gitlab.com:daihyun99/hotplacemaker.git\n
cd hotplacemaker\n
touch README.md\n
git add README.md\n
git commit -m "add README"\n
git push -u origin master\n\n

Existing folder or Git repository\n\n

cd existing_folder\n
git init\n
git remote add origin git@gitlab.com:daihyun99/hotplacemaker.git\n
git add .\n
git commit\n
git push -u origin master\n