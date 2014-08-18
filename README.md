=== Prerequisites ===

* Linux stress tool
* Linux cpulimit tool
* Ruby (developed and tested with 2.1.2)
* Bundler (http://http://bundler.io/)

=== Installation ===
Clone stoker git repository

git clone git@dev.cyfronet.pl:atmosphere/stoker.git

Enter stoker directory.

cd stoker

Install required gems

bundle install

=== Configuration ===

Change application environment in config.rb for instance to:

environment 'production'

If you wish to deamonize application set

daemonize false

in config.rb.


=== Running ===

puma -C conig.rb

or

bundle exec puma -C config.rb

or

rackup.
