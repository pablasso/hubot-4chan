chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe '4chan', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/4chan')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/4chan  me ([a-z0-9\-_\.]+\/?[a-z0-9\-_\.]+)( [0-9]+)?/i)

