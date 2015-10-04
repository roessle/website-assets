
//<![CDATA[
Mage.Cookies.path     = '/';
Mage.Cookies.domain   = '.www.gurado.de';
//]]>



//<![CDATA[
optionalZipCountries = ["HK","IE","MO","PA"];
//]]>



//<![CDATA[
var MRG_REGION_ALLOWED = false;
//]]>




//<![CDATA[
enUS = {"m":{"wide":["January","February","March","April","May","June","July","August","September","October","November","December"],"abbr":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]}}; // en_US locale reference
Calendar._DN = ["Sonntag","Montag","Dienstag","Mittwoch","Donnerstag","Freitag","Samstag"]; // full day names
Calendar._SDN = ["So.","Mo.","Di.","Mi.","Do.","Fr.","Sa."]; // short day names
Calendar._FD = 1; // First day of the week. "0" means display Sunday first, "1" means display Monday first, etc.
Calendar._MN = ["Januar","Februar","M\u00e4rz","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember"]; // full month names
Calendar._SMN = ["Jan","Feb","M\u00e4r","Apr","Mai","Jun","Jul","Aug","Sep","Okt","Nov","Dez"]; // short month names
Calendar._am = "vorm."; // am/pm
Calendar._pm = "nachm.";

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "Über den Kalender";

Calendar._TT["ABOUT"] =
"DHTML Datum/Zeit Wähler\n" +
"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n" +
"Die aktuellste Version erhalten Sie hier: http://www.dynarch.com/projects/calendar/\n" +
"Veröffentlicht unter der GNU LGPL. Details erfahren Sie hier: http://gnu.org/licenses/lgpl.html." +
"\n\n" +
"Datum Auswahl:\n" +
"- Verwenden Sie die \xab, \xbb Buttons um das Jahr auszuwälen\n" +
"- Verwenden Sie " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " Buttons um den Monat auszuwählen\n" +
"- Halten Sie für eine schnellere Auswahl den Maus-Button auf jeden der oberen Buttons.";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"Zeit-Auswahl:\n" +
"- Klicken Sie auf die gewünschten Zeiträume um diese auszuwählen\n" +
"- oder Shift-Mausklick um die Auswahl zu verklinern\n" +
"- oder Mausklick und ziehen für eine schnellere Auswahl.";

Calendar._TT["PREV_YEAR"] = "Vorheriger Jahr (Für Menü gedrückt halten)";
Calendar._TT["PREV_MONTH"] = "Vorheriger Monat (Für Menü gedrückt halten)";
Calendar._TT["GO_TODAY"] = "zu Heute";
Calendar._TT["NEXT_MONTH"] = "Nächster Monat (Für Menü gedrückt halten)";
Calendar._TT["NEXT_YEAR"] = "Nächstes Jahr (Für Menü gedrückt halten)";
Calendar._TT["SEL_DATE"] = "Datum auswählen";
Calendar._TT["DRAG_TO_MOVE"] = "Ziehen, um zu bewegen";
Calendar._TT["PART_TODAY"] = ' (' + "Heute" + ')';

// the following is to inform that "%s" is to be the first day of week
Calendar._TT["DAY_FIRST"] = "%s als erster Tag";

// This may be locale-dependent. It specifies the week-end days, as an array
// of comma-separated numbers. The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

Calendar._TT["CLOSE"] = "Schließen";
Calendar._TT["TODAY"] = "Heute";
Calendar._TT["TIME_PART"] = "Drücken Sie Shift(Großschreibung), klicken oder ziehen Sie um den Wert zu verändern";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%d.%m.%Y";
Calendar._TT["TT_DATE_FORMAT"] = "%e. %B %Y";

Calendar._TT["WK"] = "Woche";
Calendar._TT["TIME"] = "Zeit:";
//]]>


    var ugoftcertPro = {
        personalizationOptions: $H([]),
        dropDown: function () {
            var tpl = '<div id="gc-personalization-options">';
            tpl += '<label for="pers-opts">Gutschein-Motiv Auswählen:</label>';
            tpl += '<select id="pers-opts">';
            tpl += '<option value="0">Gutschein Auswählen</option>';
                    tpl += '</select>';
            tpl += '</div>';
            return tpl;
        },
        originalImage: null,
        baseUrl: 'http://www.gurado.de/media/'
    };

    Event.observe(window, 'load', function(e){
        var container = $('personalize-certificate-container');//.up(); // id selectors are supposed to be faster than class ones
        if(container){
            var tpl = ugoftcertPro.dropDown();
            container.insert(tpl); // add options dropdown to container
            $('pers-opts').observe('change', function (e) {
                var selected = $(this).getValue();
                var img = $$('.product-image').first().down('img');
                if (selected == '0') {
                    $('u_email_template').disable();
                    $('u_pdf_template').disable();
                    if (ugoftcertPro.originalImage) {
                        img.src = ugoftcertPro.originalImage;
                    }
                }
                var option = ugoftcertPro.personalizationOptions.get(selected);
                if (option) {
                    $('u_email_template').enable().setValue(option['email_template']);
                    $('u_pdf_template').enable().setValue(option['pdf_template']);
                    if (option['url']) {
                        var src = ugoftcertPro.baseUrl + '/' + option['url'];
                        if (!ugoftcertPro.originalImage) {
                            ugoftcertPro.originalImage = img.readAttribute('src');
                        }
                        var width = img;
                        img.src = src;
                    }
                }
            });
        }

    });

//<![CDATA[
        var Translator = new Translate({"HTML tags are not allowed":"HTML-Tags sind nicht erlaubt","Please select an option.":"Bitte w\u00e4hlen Sie eine Option.","This is a required field.":"Dies ist ein Pflichtfeld.","Please enter a valid number in this field.":"Bitte geben Sie eine g\u00fcltige Nummer in dieses Feld ein.","The value is not within the specified range.":"Der Wert ist nicht innerhalb des erlaubten Bereichs.","Please use numbers only in this field. Please avoid spaces or other characters such as dots or commas.":"Bitte nur Ziffern in diesem Feld verwenden. Vermeiden Sie Leerzeichen oder andere Zeichen au\u00dfer Punkt oder Komma.","Please use letters only (a-z or A-Z) in this field.":"Bitte nur Buchstaben (a-z oder A-Z) in diesem Feld verwenden.","Please use only letters (a-z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Bitte nur Buchstaben (a-z), Ziffern (0-9) oder Unterstriche (_) in diesem Feld verwenden, das erste Zeichen muss ein Buchstabe sein.","Please use only letters (a-z or A-Z) or numbers (0-9) only in this field. No spaces or other characters are allowed.":"Bitte nur Buchstaben (a-z oder A-Z) oder Ziffern (0-9) in diesem Feld verwenden. Leerzeichen oder andere Zeichen sind nicht erlaubt.","Please use only letters (a-z or A-Z) or numbers (0-9) or spaces and # only in this field.":"Bitte nur Buchstaben (a-z oder A-Z), Ziffern (0-9), Leerzeichen oder # f\u00fcr dieses Feld verwenden.","Please enter a valid phone number. For example (123) 456-7890 or 123-456-7890.":"Bitte geben Sie eine g\u00fcltige Telefonnummer ein. Zum Beispiel (123) 456-7890 oder 123-456-7890.","Please enter a valid fax number. For example (123) 456-7890 or 123-456-7890.":"Bitte tragen Sie eine g\u00fcltige Faxnummer ein. Zum Beispiel (123) 456-7890 oder 123-456-7890.","Please enter a valid date.":"Bitte geben Sie ein g\u00fcltiges Datum ein.","Please enter a valid email address. For example johndoe@domain.com.":"Bitte geben Sie eine g\u00fcltige E-Mail Adresse ein. Zum Beispiel johndoe@domain.de.","Please use only visible characters and spaces.":"Bitte nur sichtbare Zeichen verwenden.","Please enter 6 or more characters. Leading or trailing spaces will be ignored.":"Bitte geben Sie 6 oder mehr Zeichen ein. Leerzeichen am Anfang oder Ende der Zeichenkette werden entfernt.","Please enter 7 or more characters. Password should contain both numeric and alphabetic characters.":"Bitte geben Sie 7 oder mehr Zeichen ein. Ein Passwort sollte sowohl aus Ziffern wie aus Buchstaben bestehen.","Please make sure your passwords match.":"Bitte stellen Sie sicher, dass die beiden Passworte identisch sind.","Please enter a valid URL. Protocol is required (http:\/\/, https:\/\/ or ftp:\/\/)":"Bitte geben Sie eine g\u00fcltige URL ein. M\u00f6gliche Protokolle (http:\/\/, https:\/\/ or ftp:\/\/)","Please enter a valid URL. For example http:\/\/www.example.com or www.example.com":"Bitte geben Sie eine g\u00fcltige URL ein. Zum Beispiel http:\/\/www.beispiel.de oder www.beispiel.de","Please enter a valid URL Key. For example \"example-page\", \"example-page.html\" or \"anotherlevel\/example-page\".":"Bitte geben Sie einen g\u00fcltigen URL-Bezeichner ein. Zum Beispiel \"beispiel-seite\", \"beispiel-seite.html\" or \"unterverzeichnis\/beispiel-seite\".","Please enter a valid XML-identifier. For example something_1, block5, id-4.":"Bitte geben Sie einen g\u00fcltigen XML-Identifizierer an. Zum Beispiel irgendetwas_1, block5, id-4.","Please enter a valid social security number. For example 123-45-6789.":"Bitte geben Sie eine g\u00fcltige Sozialversicherungsnummer ein. Zum Beispiel 123-45-6789.","Please enter a valid zip code. For example 90602 or 90602-1234.":"Bitte geben Sie eine g\u00fcltige Postleitzahl ein. Zum Beispiel 21335.","Please enter a valid zip code.":"Bitte geben Sie eine g\u00fcltige Postleitzahl ein.","Please use this date format: dd\/mm\/yyyy. For example 17\/03\/2006 for the 17th of March, 2006.":"Bitte verwenden Sie dieses Datumsformat: tt\/mm\/jjjj. Zum Beispiel 17\/03\/2006 f\u00fcr den 17. M\u00e4rz 2006.","Please enter a valid $ amount. For example $100.00.":"Bitte geben Sie einen g\u00fcltigen Betrag ein. Zum Beispiel 100,00 \u20ac.","Please select one of the above options.":"Bitte w\u00e4hlen Sie eine der oberen Optionen.","Please select one of the options.":"Bitte w\u00e4hlen Sie eine der Optionen.","Please select State\/Province.":"Bitte Land\/Bundesland w\u00e4hlen.","Please enter a number greater than 0 in this field.":"Bitte geben Sie eine Zahl gr\u00f6\u00dfer 0 in dieses Feld ein.","Please enter a number 0 or greater in this field.":"Bitte tragen Sie eine Zahl gr\u00f6\u00dfer\/gleich 0 in dieses Feld ein.","Please enter a valid credit card number.":"Bitte geben Sie eine g\u00fcltige Kreditkartennummer ein.","Credit card number does not match credit card type.":"Kreditkartennummer entspricht nicht Kreditkartentyp.","Card type does not match credit card number.":"Kreditkartenart entspricht nicht der angegeben Kreditkartennummer.","Incorrect credit card expiration date.":"Falsches Kreditkarten Ablaufdatum.","Please enter a valid credit card verification number.":"Bitte tragen Sie eine g\u00fcltige Kreditkarten-Pr\u00fcfnummer ein.","Please use only letters (a-z or A-Z), numbers (0-9) or underscore(_) in this field, first character should be a letter.":"Bitte nur Buchstaben (a-z oder A-Z), Ziffern (0-9) oder Unterstriche (_) in diesem Feld verwenden, das erste Zeichen muss ein Buchstabe sein.","Please input a valid CSS-length. For example 100px or 77pt or 20em or .5ex or 50%.":"Bitte geben Sie eine g\u00fcltige CSS-L\u00e4nge an. Beispielsweise 100px, 77pt, 20em, .5ex oder 50%.","Text length does not satisfy specified text range.":"Text L\u00e4nge entspricht nicht der gesetzten Bereichs.","Please enter a number lower than 100.":"Bitte tragen Sie keine Zahl gr\u00f6\u00dfer\/gleich 100 in dieses Feld ein.","Please select a file":"Bitte w\u00e4hlen Sie eine Datei","Please enter issue number or start date for switch\/solo card type.":"Bitte geben Sie eine Vorgangsnummer oder ein Startdatum switch\/solo Karten an.","Please wait, loading...":"Bitte warten, wird geladen...","This date is a required value.":"Das Datum ist eine ben\u00f6tigte Angabe.","Please enter a valid day (1-%d).":"Bitte geben Sie einen g\u00fcltigen Tag (1-%d) an.","Please enter a valid month (1-12).":"Bitte geben Sie einen g\u00fcltigen Monat (1-12) an.","Please enter a valid year (1900-%d).":"Bitte geben Sie ein g\u00fcltiges Jahr (1900-%d) an.","Please enter a valid full date":"Bitte geben Sie eine vollst\u00e4ndiges, g\u00fcltiges Datum an","Please enter a valid date between %s and %s":"Bitte geben Sie ein g\u00fcltiges Datum zwischen dem %s und %s an","Please enter a valid date equal to or greater than %s":"Bitte geben Sie ein g\u00fcltiges Datum am oder nach dem %s an","Please enter a valid date less than or equal to %s":"Bitte geben Sie ein g\u00fcltiges Datum am oder vor dem %s an","Complete":"Vollst\u00e4ndig","Add Products":"Artikel hinzuf\u00fcgen","Please choose to register or to checkout as a guest":"Bitte registrieren Sie sich, oder gehen Sie als Gast zur Kasse","Your order cannot be completed at this time as there is no shipping methods available for it. Please make necessary changes in your shipping address.":"Ihre Bestellung kann momentan nicht abgeschlossen werden, da keine Versandarten daf\u00fcr verf\u00fcgbar sind.","Please specify payment method.":"Bitte bestimmen Sie die Bezahlmethode.","Your order cannot be completed at this time as there is no payment methods available for it.":"Ihre Bestellung kann momentan nicht abgeschlossen werden, da keine Bezahlmethoden daf\u00fcr verf\u00fcgbar sind."});
        //]]>
