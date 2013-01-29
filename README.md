# vagrant box

Logstash + AMQP example

once up, toybox and toybox2 can both be used as the shipper or indexer.

## Shipper
    java -jar logstash.jar agent -f logstash-shipper.conf

## Indexer, Elasticsearch, Rabbitmq, Kibana
    java -jar logstash.jar agent -f logstash-indexer.conf
    ./elasticsearch-0.20.4/bin/elasticsearch -f
    ./rabbitmq\_server-3.0.1/sbin/rabbitmq-server -v
    ruby ./Kibana-0.2.0/kibana.rb

