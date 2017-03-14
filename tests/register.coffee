assert = require "assert"

register = require "../server/db/register"


describe "Password", ->
  describe "Salt", ->
    it "should be unique", ->
      assert.notEqual register.makeSalt(), register.makeSalt()
    
    it "should be 32 characters long", ->
      assert.equal register.makeSalt().length, 32 

  describe "Hash", ->
    it "should have the same output, with same input", ->
      randomSalt = register.makeSalt()
      assert.equal (register.hash randomSalt), (register.hash randomSalt)
    
    it "should have different outputs with different input", ->
      assert.notEqual (register.hash register.makeSalt()), (register.hash register.makeSalt())

    it "should have a length of 64", ->
      assert.equal (register.hash register.makeSalt()).length, 64 