sudo wget -O /home/vagrant/logstash.jar https://logstash.objects.dreamhost.com/release/logstash-1.1.9-monolithic.jar
sudo wget -O /home/vagrant/rabbitmq.tar.gz http://www.rabbitmq.com/releases/rabbitmq-server/v3.0.1/rabbitmq-server-generic-unix-3.0.1.tar.gz
sudo wget -O /home/vagrant/elasticsearch.tar.gz http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.4.tar.gz
sudo wget -O /home/vagrant/kibana.tar.gz https://github.com/rashidkpc/Kibana/archive/v0.2.0.tar.gz
sudo wget -O /home/vagrant/rubygems.tgz http://production.cf.rubygems.org/rubygems/rubygems-1.8.25.tgz
sudo tar -zxvf /home/vagrant/rabbitmq.tar.gz -C /home/vagrant/
sudo tar -zxvf /home/vagrant/elasticsearch.tar.gz -C /home/vagrant/
sudo tar -zxvf /home/vagrant/kibana.tar.gz -C /home/vagrant/
sudo tar -zxvf /home/vagrant/rubygems.tgz -C /home/vagrant/
sudo chown -R vagrant:vagrant /home/vagrant
