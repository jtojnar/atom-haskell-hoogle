# haskell-hoogle package

Lets you look up the marked text on http://www.haskell.org/hoogle via context menu, toolbar item and the exposed command `haskell-hoogle:lookup`.

![A screenshot of your package](http://i.imgur.com/WqC6tT9.gif)

Hoogle URL can be configured, following URLs have been tested:

* Original Hoogle (default): `https://www.haskell.org/hoogle/?mode=json&hoogle={query}&start=1&count=100`

Following URLs use different JSON format:

* Hoogle 5: `http://hoogle.haskell.org/?mode=json&hoogle={query}&start=1&count=100`
* Hayoo: `http://hayoo.fh-wedel.de/json?query={query}`

Following URLs do not offer JSON format:

* Stackage LTS Haskell: `https://www.stackage.org/lts/hoogle?q={query}&start=1&count=100&mode=json`
* Stackage Nightly Haskell: `https://www.stackage.org/nightly/hoogle?q={query}&start=1&count=100&mode=json`
