<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>jQuery mtree.js demos</title>
<link rel='stylesheet prefetch' href='https://cdn.jsdelivr.net/foundation/5.0.2/css/foundation.css'>
<link href="css/mtree.css" rel="stylesheet" type="text/css">
<style>
.mtree-demo .mtree {
  background: #EEE;
  margin: 20px auto;
  max-width: 320px;
  border-radius: 3px;
}

.mtree-skin-selector {
  text-align: center;
  background: #EEE;
  padding: 10px 0 15px;
}

.mtree-skin-selector li {
  display: inline-block;
  float: none;
}

.mtree-skin-selector button {
  padding: 5px 10px;
  margin-bottom: 1px;
  background: #BBB;
}

.mtree-skin-selector button:hover { background: #999; }

.mtree-skin-selector button.active {
  background: #999;
  font-weight: bold;
}

.mtree-skin-selector button.csl.active { background: #FFC000; }
</style>

</head>

<body>
<div class="jquery-script-ads" align="center"><script type="text/javascript"><!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
  <ul class="mtree transit">
    <li><a href="#">Africa</a>
      <ul>
        <li><a href="#">Algeria</a></li>
        <li><a href="#">Marocco</a></li>
        <li><a href="#">Libya</a></li>
        <li><a href="#">Somalia</a></li>
        <li><a href="#">Kenya</a></li>
        <li><a href="#">Mauritania</a></li>
        <li><a href="#">South Africa</a></li>
      </ul>
    </li>
    <li><a href="#">America</a>
      <ul>
        <li><a href="#">North-America</a>
          <ul>
            <li><a href="#">Canada</a></li>
            <li><a href="#">USA</a>
              <ul>
                <li><a href="#">New York</a></li>
                <li><a href="#">California</a>
                  <ul>
                    <li><a href="#">Los Angeles</a></li>
                    <li><a href="#">San Diego</a></li>
                    <li><a href="#">Sacramento</a></li>
                    <li><a href="#">San Francisco</a></li>
                    <li><a href="#">Bakersville</a></li>
                  </ul>
                </li>
                <li><a href="#">Lousiana</a></li>
                <li><a href="#">Texas</a></li>
                <li><a href="#">Nevada</a></li>
                <li><a href="#">Montana</a></li>
                <li><a href="#">Virginia</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li><a href="#">Middle-America</a>
          <ul>
            <li><a href="#">Mexico</a></li>
            <li><a href="#">Honduras</a></li>
            <li><a href="#">Guatemala</a></li>
          </ul>
        </li>
        <li><a href="#">South-America</a>
          <ul>
            <li><a href="#">Brazil</a></li>
            <li><a href="#">Argentina</a></li>
            <li><a href="#">Uruguay</a></li>
            <li><a href="#">Chile</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#">Asia</a>
      <ul>
        <li><a href="#">China</a></li>
        <li><a href="#">India</a></li>
        <li><a href="#">Malaysia</a></li>
        <li><a href="#">Thailand</a></li>
        <li><a href="#">Vietnam</a></li>
        <li><a href="#">Singapore</a></li>
        <li><a href="#">Indonesia</a></li>
        <li><a href="#">Mongolia</a></li>
      </ul>
    </li>
    <li><a href="#">Europe</a>
      <ul>
        <li><a href="#">North</a>
          <ul>
            <li><a href="#">Norway</a></li>
            <li><a href="#">Sweden</a></li>
            <li><a href="#">Finland</a></li>
          </ul>
        </li>
        <li><a href="#">East</a>
          <ul>
            <li><a href="#">Romania</a></li>
            <li><a href="#">Bulgaria</a></li>
            <li><a href="#">Poland</a></li>
          </ul>
        </li>
        <li><a href="#">South</a>
          <ul>
            <li><a href="#">Italy</a></li>
            <li><a href="#">Greece</a></li>
            <li><a href="#">Spain</a></li>
          </ul>
        </li>
        <li><a href="#">West</a>
          <ul>
            <li><a href="#">France</a></li>
            <li><a href="#">England</a></li>
            <li><a href="#">Portugal</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#">Oceania</a>
      <ul>
        <li><a href="#">Australia</a></li>
        <li><a href="#">New Zealand</a></li>
      </ul>
    </li>
    <li><a href="#">Arctica</a></li>
    <li><a href="#">Antarctica</a></li>
</ul>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src='http://cdnjs.cloudflare.com/ajax/libs/velocity/0.2.1/jquery.velocity.min.js'></script> 
<script src="js/mtree.js"></script> 
<script>
$(document).ready(function() {
  var mtree = $('ul.mtree');
  
  // Skin selector for demo
  mtree.wrap('<div class=mtree-demo></div>');
  var skins = ['bubba','skinny','transit','jet','nix'];
  mtree.addClass(skins[0]);
  $('body').prepend('<div class="mtree-skin-selector"><ul class="button-group radius"></ul></div>');
  var s = $('.mtree-skin-selector');
  $.each(skins, function(index, val) {
    s.find('ul').append('<li><button class="small skin">' + val + '</button></li>');
  });
  s.find('ul').append('<li><button class="small csl active">Close Same Level</button></li>');
  s.find('button.skin').each(function(index){
    $(this).on('click.mtree-skin-selector', function(){
      s.find('button.skin.active').removeClass('active');
      $(this).addClass('active');
      mtree.removeClass(skins.join(' ')).addClass(skins[index]);
    });
  })
  s.find('button:first').addClass('active');
  s.find('.csl').on('click.mtree-close-same-level', function(){
    $(this).toggleClass('active'); 
  });
});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>
