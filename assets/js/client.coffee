
#############
# FUNCTIONS #
#############

InitPage = ->
    ScrollHandler()

    currentDate = new Date()
    $('.current-date').text currentDate.getFullYear()

    # $('.header-down a').click ->
    #     $('html, body').animate { scrollTop: $( '#content' ).offset().top }, 400
    #     return false

ColorLuminance = (hex,lum) ->
    hex = String(hex).replace(/[^0-9a-f]/gi, '')
    if hex.length < 6
        hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2]
    lum = lum || 0

    rgb = '#'

    for i in [0..2]
        c = parseInt(hex.substr(i*2,2), 16)
        c = Math.round(Math.min(Math.max(0, c + (c * lum)), 255)).toString(16)
        rgb += ('00'+c).substr(c.length)

    return rgb

ScrollHandler = ->
    n = Math.ceil $('body').scrollTop()
    winH = $(window).height()

    moonPos = 50 + (n * 1.2)
    opacity = 1 - Math.min((n / winH), 1.0)

    if $('body').hasClass 'expanded'
        bgColor = ColorLuminance('#313261', -0.5)
    else
        bgColor = ColorLuminance('#313261', Math.min((n / winH), 1.0) * -0.5)


    $('.header-moon').css "top", moonPos + "px"
    $('.header-moon-bg').css "top", moonPos + "px"

    $('#main-header').css "opacity", opacity

    $('body').css "background-color", bgColor


###############
# MAIN SCRIPT #
###############

$(window).load ->
    InitPage()

window.onscroll = ->
    ScrollHandler()
