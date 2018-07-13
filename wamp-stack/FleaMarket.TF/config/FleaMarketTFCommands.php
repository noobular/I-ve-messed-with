<?php
  function redirect($url)
   {    
    if (!headers_sent())
    {    
      header('Location: '.$url);
      exit;
    }
   else
    {      
      echo '<html>';
      echo '<script type="text/javascript">';
      echo 'window.location.href="'.$url.'";';
      echo '</script>';
      echo '<noscript>';
      echo '<meta http-equiv="refresh" content="0;url='.$url.'" />';
      echo '</noscript>'; 
      echo'</html>';

      exit;

   }
} 
?>