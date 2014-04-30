$.fn.hasClassMatch = (rexp) ->
    for element in @
        for c in $(element).attr('class').split(' ')
            return true if c.match rexp
    false

$.fn.removeClassMatch = (rexp) ->
    this.removeClass (i, css) -> (c for c in css.split(' ') when c.match(rexp)).join(' ')
