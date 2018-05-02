# Dude, Where's My VIN?

I (usually) have better things to do than obsessively check my reservation status page to see if they've assigned me a VIN yet. So I decided to automate that part of my life.

This is a simple test suite written for [Robot Framework](http://robotframework.org/) that will check your Tesla reservation to see if your VIN has been assigned. I used [PushBullet](https://www.pushbullet.com/) to notify me if the test passes.

Modify this all you want, I make no claims it will work for you. I also offer no support (but will accept contributions and/or enhancements). This was developed on Mac OS X, modifications may be necessary to get it to run on other platforms. Have at it!

## Requirements

- Chrome

  - You may need to install Chromedriver separately, available at [Chromedriver Downloads](https://sites.google.com/a/chromium.org/chromedriver/downloads)
  - on macOS, copy the `chromedriver` extracted from the ZIP file to `/usr/local/bin` and:
  
    ```chmod +x /usr/local/bin/chromedriver```
    
    Procedure may differ for other platforms.

- Python 3

- these Python packages:

  ```bash
  pip install pushbullet-cli
  pip install robotframework
  pip install robotframework-seleniumlibrary
  ```

## Setup

Modify the `resource.robot` file to contain your Tesla account email, password, reservation number you want to check on, and [Pushbullet API key](https://www.pushbullet.com/#settings/account). By default it uses the `pb` command to send a notification to all configured [PushBullet](https://www.pushbullet.com) devices.

Oh yeah, and you'll need to configure [pushbullet-cli](https://github.com/GustavoKatel/pushbullet-cli) to set your API key, device, etc., if you want to get push notifications. Your API key is also known as your Access Token, and is available from your [Pushbullet Account Page](https://www.pushbullet.com/#settings/account).

Optionally, you could change how you get notified by modifying the command in the `Notify` keyword. For example, you could change the line to read something like this if you use [Keybase](https://keybase.io/) (and you really should, it's awesome):

```
   Run    keybase chat send ${KB USER} ${message}`
```

Then you would add variables (in this case `${KB USER}`) as appropriate.

## Run

Execute `robot tesla.robot` to execute the test suite.

Or you can add the `cron.sh` script to your crontab to execute every so often, e.g.:

`0	*	*	*	*	cd ~/dude-wheres-my-vin && ./cron.sh`  (This will check on minute 0, i.e. the first minute, of every hour.)

You may have to modify the `cron.sh` file to contain the correct path to your `robot` and `chromedriver` executables.

### Also...

If you have more than one reservation, you can modify `tesla.robot` file to duplicate the `VIN check` test with different reservation numbers.
