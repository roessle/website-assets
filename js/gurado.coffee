# Google Analytics
((i, s, o, g, r, a, m) ->
  i['GoogleAnalyticsObject'] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return

  i[r].l = 1 * new Date
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
  return
) window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga'
ga 'create', 'UA-3749635-2', 'auto'
ga 'send', 'pageview'

jQuery(document).ready ->
  #
  jQuery('.logo').find('img[src$="roessle/media/homepage/websites/2/stamp_roessle.png"]')
    .replaceWith '<div class="visible-desktop visible-tablet logo-stamp-hotel-gasthof-roessle"></div>'

  jQuery('.slider').find('img[src$="roessle//media/subpage/websites/2/home.jpg"]')
    .replaceWith '
      <div class="span4 hero-1">
        <div class="hero-1-txt">Verschenken Sie einen<br>unvergesslichen Augenblick</div>
      </div>
      <div class="span8 hero-2">
      </div>'

  jQuery('#themeCss').after '
    <div class="navigation-colors-bar">
    </div>
    <div class="meta-navigation">
      <div class="container">
        <div class="row">
          <ul>
            <li><a href="http://www.roessle.eu">Buchen</a></li>
            <li><a href="http://www.roessle.eu">Gutscheine</a></li>
            <li><a href="http://www.roessle.eu">Kontakt</a></li>
          </ul>
        </div>
      </div>
    </div>'
