# MusicPond

If you've ever worked with a few people in the same space, you probably noticed this: somebody is the DJ and gets asked to skip / add some tracks, usually YouTube videos.

I certainly have! Thus, this is my attempt to democratize this process (not that there's something wrong with it). Basically it's an online YouTube playlist.

_example_playlist.sql_ contains a few tracks, to get you started. We've been listening to these, hence the varied styles.

## Demo

Really, it's way easier to understand this way: [launch app](http://demo.armin.ro/musicpond/ "MusicPond Demo"). Then open another tab/window with the same link. Then imagine this working globally, uniting Queen fans from Africa with Kei$ha fans in the US.

## FAQ

### My track just won't be added. What gives?

There can be a couple of reasons for that (and I should probably write some code to tell you which):

1. The video is **not embeddable**, meaning you can only view them on YouTube. On YouTube, press the _share_ button, then _embed_. If you can't, _search for another video_...
2. The video is **not viewable in the configured country**. You see, poeple can restrict people to viewing videos only in certain countries. Think of it as Region encoding for DVDs. There's nothing you can really do about it, maybe write to your local politician to pressure the RIAA. Other than that, _search for another video_...
3. Something else went totally wrong, for which I am positively not to blame. Try refreshing the window, or, _search for another video_...

### What's with the delay?

You see, the way this works, you tell the server to do something, then it gets back to your browser and does the same. This is because I wanted it to play on all clients synchronously ('cause 20 loudspeakers screaming Lady Gaga is so much better than 2). It might get there at some point, but for now, there's a 2-4 second delay to everything.

Besides, you should see how crazy it gets when somebody is buzzing through tracks ...

### Why are some tracks played more often?

Because actually they are played rarely, or you just added them. Basically, it tries to play every track as often, but most people change tracks because they like them, a lot. So MusicPond tries to play the neglected tracks as often as possible (until you remove them - if you nobody likes them).

### Why does it randomly stop playing?

Well, it's actually not random and mostly has to do with _YouTube's iFrame API_. This is a fresh, new and largely unsupported embed method, which I use because:

1. I like living on the edge
2. it works with mobile devices

The code is largely the same for chromeless embed and it should be really easy to convert (I know this because it originally was this).

## Changelog

### 2012.10.11

* minor code cleanup
* switched to [jQuery TubePlayer](https://github.com/nirvanatikku/jQuery-TubePlayer-Plugin) for YouTube handling
* switched to [CodeKit](https://incident57.com/codekit/) for .less and JavaScript concatenation & compression (if you're not into this, just merge all the .js into script.js)
* moved video player ahead of playlist, as it was eating up just to much processing power

### 2012.01.23

* initial release

## License

* The rest is licensend under the [BSD 3-Clause License](http://www.opensource.org/licenses/BSD-3-Clause). And I'd appreciate a note if you like it.
* Less Class is (copyright) NetTuts.