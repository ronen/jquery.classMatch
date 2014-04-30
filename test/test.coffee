window = require('jsdom').jsdom('<html><body></body></html>').createWindow()

global.$ = require('jquery')(window)

assert = require 'assert'
require '../jquery.classMatch'

$buildElems = ->
    $root = $("<div>")
    $root.append $("<div>").attr("id", "A").addClass("A0").addClass("A1")
    $root.append $("<div>").attr("id", "B").addClass("B0").addClass("B1")
    $root.find('*')

describe 'hasClassMatch', ->
    $elems = $buildElems()

    it 'should return false when no classes match', ->
        assert.ok !$elems.hasClassMatch(/x/)

    it 'should return true when one element has one class that matches', ->
        assert.ok $elems.hasClassMatch(/A0/)
    
    it 'should return true when one element has several classes that match', ->
        assert.ok $elems.hasClassMatch(/B0/)
    
    it 'should return true when two elements have classes that match', ->
        assert.ok $elems.hasClassMatch(/1/)

describe 'removeClassMatch', ->
    $elems = $buildElems()
    it 'should remove matching class', ->
        $elems.removeClassMatch(/0/)
        assert.equal $elems.filter('#A').attr('class'), "A1"
        assert.equal $elems.filter('#B').attr('class'), "B1"
