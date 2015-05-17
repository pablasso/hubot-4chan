# hubot-4chan

4chan integration with Hubot.

## Installation

In a hubot project, run:

`npm install hubot-4chan --save`

Then add **hubot-4chan** to your `external-scripts.json`:

```json
[
  "hubot-4chan"
]
```

## Usage

The command `hubot 4chan me <board> [limit]` returns results from the 4chan board specified.

For example:

```
user1>> hubot 4chan me b 3
hubot>> http://example.com/example1.gif - This is a sample - http://example.com/b/thread1
hubot>> http://example.com/example2.gif - This is a sample - http://example.com/b/thread2
hubot>> http://example.com/example3.gif - This is a sample - http://example.com/b/thread3
```
