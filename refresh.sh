bundle install
sudo service postgresql restart
rake db:reset
rake db:migrate
rake db:seed
