In Kibana we can view operation logs with this query:

/app/kibana#/discover?_g=()&_a=(columns:!(_source),index:'.operations.*',interval:auto,query:(match_all:()),sort:!('@timestamp',desc))



![1543583450510](1543583450510.png) 
