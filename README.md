# Website assets for roessle.eu

Assets for [roessle-stetten.jmdo.com](http://roessle-stetten.jmdo.com) / [roessle.eu](http://roessle.eu)

[![Build Status](https://circleci.com/gh/roessle/website-assets.svg?style=shield)](https://circleci.com/gh/roessle/website-assets)

## Requirements

* Node.js
* npm
* Grunt

## Install the dependencies

```shell
npm install
```

## Building the project

```shell
grunt build
```

## Starting the local HTTP server

```shell
grunt dev
```

### Loading assets from the local HTTP server

1. Install [Switcheroo Redirector](https://github.com/ranjez/Switcheroo) Extension in Chrome
2. Setup the following redirect rule in **Switcheroo Redirector**: 

    `http://assets.roessle.eu/` > `http://localhost:9000/`
