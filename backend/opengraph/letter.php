<?php

$letter = isset($_GET['letter']) ? $_GET['letter'] : '';

if ($letter && strlen($letter) == 1 && ctype_alpha($letter)) {
?>
<!DOCTYPE html>
<html>
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# esg_parzns: http://ogp.me/ns/fb/esg_parzns#">
  <meta property="fb:app_id" content="473854159303213" /> 
  <meta property="og:type"   content="esg_parzns:letter" /> 
  <meta property="og:url"    content="http://hackathon.eastsidegamestudio.com/esg-worldhack/backend/opengraph/letter.php?letter=<?php echo $letter; ?>" /> 
  <meta property="og:title"  content="The Letter <?php echo strtoupper($letter); ?>" /> 
  <meta property="og:image"  content="<?php echo $baseUrl . '/assets/images/letters/' . strtolower($letter) . '.png'; ?>" />
</head>
<body>
<img src="<?php echo $baseUrl . '/assets/images/letters/' . strtolower($letter) . '.png'; ?>" />
</body>
</html>
<?php
}
?>