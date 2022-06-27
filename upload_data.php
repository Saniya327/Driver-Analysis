<?php
   $con = mysqli_connect("localhost","root","root","torque");
   if (mysqli_connect_errno($con)) {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
   }

   $keys = array();
   $values = array();
   foreach ($_GET as $key => $value) {
   // Keep columns starting with k
      if (preg_match("/^k/", $key)) {
          $keys[] = $key;
          $values[] = $value;
          $submitval = 1;
      }
      else if (in_array($key, array("v", "eml", "time", "id", "session"))) {
          $keys[] = $key;
          $values[] = "'".$value."'";
          $submitval = 1;
      }
   }

   if ((sizeof($keys) === sizeof($values)) && sizeof($keys) > 0) {
        // Now insert the data for all the fields
        $sql = "INSERT INTO raw_logs (".implode(",", $keys).") VALUES (".implode(",", $values).")";
        if (mysqli_query($con, $sql)) {
          echo "OK!";
       }
   }

   mysqli_close($con);
?>