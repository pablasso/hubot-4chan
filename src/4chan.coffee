# Description:
#   4chan integration with Hubot.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot 4chan me <board> [limit] - Returns results from 4chan board.
#
# Author:
#   Juan Pablo Ortiz <pablasso@gmail.com>

main_site = "http://boards.4chan.org/"
lookup_site = "http://a.4cdn.org/"
images_site = "http://i.4cdn.org/"

module.exports = (robot)->
  robot.respond /4chan me ([a-z0-9]+)( [0-9]+)?/i, (message)->
    lookup_4chan message, (text)->
      message.send text

  lookup_4chan = (message, response_handler)->
    top = parseInt message.match[2] || 15
    board = message.match[1]
    location = "#{lookup_site}#{board}/1.json"

    message.http( location ).get() (error, response, body)->
      return response_handler "Sorry, something went wrong" if error
      return response_handler "4chan doesn't know what you're talking about" if response.statusCode == 404
      return response_handler "4chan doesn't want anyone to go there any more." if response.statusCode == 403

      threads  = JSON.parse(body).threads
      count = 0

      for thread in threads
        count++

        continue if thread.posts.length == 0

        post = thread.posts[0]
        image = "#{images_site}#{board}/#{post.tim}#{post.ext}"
        link = "#{main_site}#{board}/thread/#{post.no}/#{post.semantic_url}"
        text = "#{image} - #{post.com} - #{link}"
        response_handler text

        break if count == top

