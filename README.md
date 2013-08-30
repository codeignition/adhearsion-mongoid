adhearsion-mongoid
==================

adhearsion-mongoid is an (Adhearsion|https://github.com/adhearsion/adhearsion) Plugin providing (Mongoid|https://github.com/mongoid/mongoid) compatibility.

Features
--------

* Append compatibility with Mongoid 3.0+

Requirements
------------

* Adhearsion 2.0+

Testing environment
-------------------

Plugin has been tested with Adhearsion 2.4, Ruby 2.0 and Mongoid 4.0 (development).

Install
-------

Add `adhearsion-mongoid` to your Adhearsion app's Gemfile.

Plugin configuration (optional)
-------------------------------

In your Adhearsion app configuration file, add the following values:

```ruby
Adhearsion.config[:adhearsion_mongoid] do |config|
  config.models_paths = "lib/models"
  config.config_path = "config/mongoid.yml"
end
```

Mongoid configuration
---------------------

By default, simply use "config/mongoid.yml" configuration file.

Usage
-----

Simply place your models in in your model directory ("lib/models" by default) and thats all.


Author
------

Original author: [Florent Morin](https://github.com/florentmorin)

Special Thanks
--------------

Thanks to [Juan de Bravo](https://github.com/juandebravo) for the adhearsion-activerecord plugin
My plugin was simply adapted from it.

Links
-----
* [Source](https://github.com/morin-innovation/adhearsion-mongoid)
* [Documentation](http://rdoc.info/github/morin-innovation/adhearsion-mongoid/master/frames)
* [Bug Tracker](https://github.com/morin-innovation/adhearsion-mongoid/issues)

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Check [License file](https://github.com/morin-innovation/adhearsion-mongoid/blob/master/LICENSE)