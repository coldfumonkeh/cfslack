# Slack API

A ColdFusion component to interact with the [Slack API](https://api.slack.com/methods):

[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/tested-with-testbox.svg)](https://cfmlbadges.monkehworks.com)
[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/compatibility-lucee-45.svg)](https://cfmlbadges.monkehworks.com)
[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/compatibility-lucee-5.svg)](https://cfmlbadges.monkehworks.com)

## Base Component

Instantiate the `slack.cfc` component and pass in the required properties like so:

```
var oSlack = new slack(
	clientID 			= clientID,
	clientSecret 		= clientSecret,
	verificationToken 	= verificationToken,
	accessToken			= accessToken,
	botAccessToken		= botAccessToken
);
```

### Method Components

Each sub-set of Slack API methods has been split into their own components, all of which are instantiated into the core `slack` component.

These are:

* bot
* channel
* chat
* dialog
* emoji
* permissions
* team
* user

To make requests to methods within these components you will first need to call the component itself:

```
var oBot    = oSlack.getBot();
var botInfo = oBot.getBotInfo();
```

or

```
var botInfo = oSlack.getBot().getBotInfo();
```


In Progress
----------------

A lot of methods are already included, but this is still a work in progress as not all have been implemented (yet).


Testing
----------------
The component has been tested against Lucee 4.5 and Lucee 5.


Download
----------------
[Slack CFC](https://github.com/coldfumonkeh/cfslack/downloads)

### 1.0.0 - November 01, 2017

- Commit: Initial Release


MIT License

Copyright (c) 2012 Matt Gifford (Monkeh Works Ltd)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
