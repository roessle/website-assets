jQuery(document).ready ->
  #
  jQuery('.logo')
    .append '<div class="visible-desktop visible-tablet logo-stamp-hotel-gasthof-roessle"></div>'

  jQuery('.slider')
    .append '
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
            <li><a href="http://www.roessle.eu/schnellzugriffsleiste/buchung/">Buchen</a></li>
            <li><a href="http://www.gurado.de/roessle/">Gutscheine</a></li>
            <li><a href="http://www.roessle.eu/kontakt0/msg/">Kontakt</a></li>
          </ul>
        </div>
      </div>
    </div>'
