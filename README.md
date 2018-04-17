# Dude, Where's My VIN?

I (usually) have better things to do than obsessively check my reservation status page to see if they've assigned me a VIN yet. So I decided to automate that part of my life.

This is a simple test suite written for [Robot Framework](http://robotframework.org/) that will check your Tesla reservation to see if your VIN has been assigned. I used [PushBullet](https://www.pushbullet.com/) to notify me if the test passes.

Modify this all you want, I make no claims it will work for you. I also offer no support (but will accept contributions and/or enhancements). This was developed on Mac OS X, modifications may be necessary to get it to run on other platforms. Have at it!

## Requirements

- Chrome

- Python 3

- these Python packages:

  ```bash
  pip install pushbullet-cli
  pip install robotframework
  pip install robotframework-seleniumlibrary
  ```

## Setup

Modify the `resource.robot` file to contain your Tesla account email, password, and reservation number you want to check on. You could also change how you get notified by modifying the command in the `Notify` keyword.

Oh yeah, and you'll need to configure [pushbullet-cli](https://github.com/GustavoKatel/pushbullet-cli) if you want to use that part of it.

## Run

Execute `robot tesla.robot` to execute the test suite.

Or you could add the `cron.sh` script to your crontab to execute every so often, e.g.:

`0	*	*	*	*	cd ~/dude-wheres-my-vin && ./cron.sh`

You may have to modify the `cron.sh` file to contain the correct path to your `robot` and `chromedriver` executables.