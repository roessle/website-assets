# Website assets for roessle.eu

Assets for [roessle-stetten.jmdo.com](http://roessle-stetten.jmdo.com) / [roessle.eu](http://roessle.eu)

[![Build Status](https://circleci.com/gh/roessle/website-assets.svg?style=shield)](https://circleci.com/gh/roessle/website-assets)

## Requirements

* Node.js
* yarn

## Install the dependencies

```shell
yarn
```

## Building the project

```shell
yarn run grunt build
```

## Starting the local HTTP server

```shell
yarn run grunt dev
```

### Loading assets from the local HTTP server

1. Install [Switcheroo Redirector](https://github.com/ranjez/Switcheroo) Extension in Chrome
2. Setup the following redirect rule in **Switcheroo Redirector**:

    `http://assets.roessle.eu/` > `http://localhost:9000/`

## Setup Jimdo website using assets in this repo

#### Custom layout HTML

See [jimdo_layout.html](jimdo-layout.html)

#### Custom layout CSS

```
@import url(https://fonts.googleapis.com/css?family=Alegreya+Sans:400,300,700,900);
@import url(https://fonts.googleapis.com/css?family=ABeeZee);
```

#### Custom Head

```
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="http://assets.roessle.eu/css/roessle-bootstrap.css" type="text/css" />
```

### Use slider

```
<div class="content-slider">
    <div class="slider-txt-wrapper slider-txt-wrapper-left">
        <div class="slider-txt">
            Ferienhaus Schmeienblick
        </div>
    </div>

    <div class="slider-img slider-img-right">
    </div>
</div>
```
