## Prerequisites

* Linux stress tool
* Linux cpulimit tool
* Ruby (developed and tested with 2.1.2)
* Bundler (http://http://bundler.io/)

## Installation
Clone stoker git repository

git clone git@dev.cyfronet.pl:atmosphere/stoker.git

Enter stoker directory.

cd stoker

Install required gems

bundle install

## Configuration

Change application environment in config.rb for instance to:
```
environment 'production'
```
If you wish to deamonize application set
```
daemonize false
```
in config.rb.


## Running
```
puma -C config.rb
```
or
```
bundle exec puma -C config.rb
```
or
```
rackup
```
(ignores config.rb file).

## Usage

This microservice submits jobs on the host it's running that impose specified cpu load and allocates specified amount of RAM. It exposes REST interface. Sample invocations:

```
curl -H "Content-Type: application/json" -d '{"core_percentage":70, "timeout": 180}' http://localhost:9292/loads
```
Creates a job running for 180 seconds that uses 70% of one core and 16MB RAM.

```
curl -H "Content-Type: application/json" -d '{"core_percentage":70, "memory": 64, "timeout": 180}' http://localhost:9292/loads
```
Creates a job running for 180 seconds that uses 70% of one core and allocates 64MB RAM.