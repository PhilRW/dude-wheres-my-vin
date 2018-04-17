# Dude, Where's My VIN?

This is a simple test written for [Robot Framework](http://robotframework.org/) that will check your Tesla reservation to see if your VIN has been assigned. I use [PushBullet](https://www.pushbullet.com/) to notify me if the test passes.

Modify this all you want, I make no claims it will work for you. I also offer no support. Have at it!

Requirements:

- Chrome
- Python 3
- These Python packages:

    ```bash
    pip install pushbullet-cli
    pip install robotframework
    pip install robotframework-seleniumlibrary
    ```

Modify the `resource.robot` file to contain your Tesla account email, password, and reservation number you want to check on. You could also change how you get notified by modifying the command of the `Notify` keyword.

Execute `robot tesla.robot` to execute the test suite.

Or you could add the `cron.sh` script to your crontab to execute every so often, e.g.:

`0	*	*	*	*	cd ~/dude-wheres-my-vin && ./cron.sh`

You may have to modify the `cron.sh` file to contain the correct path to your `robot` and `chromedriver` executables.