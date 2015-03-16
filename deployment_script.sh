# installing server requirements
sudo apt-get update
sudo apt-get install git-core
sudo apt-get install postgresql

# installing ruby on rails
curl -sSL https://get.rvm.io | bash -s stable
cd /home/$USER/pppk_tna && RAILS_ENV=production bundle install

# Creating Database
RAILS_ENV=production rake db:create db:migrate

# Running application
RAILS_ENV=production rails s &