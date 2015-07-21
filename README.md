## Prerequisites

* Linux stress tool
* Linux cpulimit tool
* Ruby (developed and tested with 2.1.2)
* git
* Bundler (http://bundler.io/)

## Installation

Stoker should be run from a normal user account and can be installed without superuser priviledges provided that above mentioned prerequisites are met.

1. Clone stoker git repository
```
export GIT_SSL_NO_VERIFY=1
git clone https://gitlab.dev.cyfronet.pl/atmosphere/stoker.git
```
Server certificate needs to be disabled since dice's gitlab uses self-signed certificate.
2. Enter stoker directory.
```
cd stoker
```
3. Install required gems
```
bundle install --deployment
```

## Configuration

Create configuration file based on a provided example.
```
cp config.rb.example config.rb
```
Introduce required changes in configuration. You may want to:
* Change application environment to production in config.rb:
```
environment 'production'
```
* Deamonize puma http server by setting
```
daemonize true
```
in config.rb.


## Running
```
bundle exec puma -C config.rb
```

## Usage

This microservice submits jobs on the host it's running that impose specified cpu load and allocates specified amount of RAM. It exposes REST interface. Sample invocations:

```
curl -H "Content-Type: application/json" -d '{"core_percentage": 70, "timeout": 180}' http://localhost:9292/loads
```
Creates a job running for 180 seconds that uses 70% of one core and 16MB RAM.

```
curl -H "Content-Type: application/json" -d '{"core_percentage": 70, "memory": 64, "timeout": 180}' http://localhost:9292/loads
```
Creates a job running for 180 seconds that uses 70% of one core and allocates 64MB RAM.

Parameters of the request:
* core_percentage can vary from 1 to 100 and defines single core usage in %.
* memory can vary from 1 to memory available at host expressed in MB.
* timeout specifies in seconds how long the job will run.
