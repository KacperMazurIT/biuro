<?php  include "includes/db.php"; ?>
<?php  include "includes/header.php"; ?>

<?php
   
  
    if(isset($_POST['submit']))
    {    
        $to         = $_POST['kacper_mazur@vp.pl'];
        $subject    = wordwrap($_POST['subject'], 70);
        $body       = $_POST['body'];
        $header     = "From:" .$_POST['email'];
        
        mail($to,$subject,$body,$header);
  
        
   
    }

    ?>


    <!-- Navigation -->
    
    <?php  include "includes/navigation.php"; ?>
    
 
    <!-- Page Content -->
    <div class="container">
    
<section id="login">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-xs-offset-3">
               <div class="panel panel-default">
               <div class="panel-body">
                <div class="form-wrap">
                <h1 class="text-center">Skontaktuj się z nami!</h1>
                    <form role="form" action="contact.php" method="post" id="login-form" autocomplete="off">
                       
                        <div class="form-group">
                            <label for="email" class="sr-only">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Wpisz swój email">
                        </div>
                        <div class="form-group">
                            <label for="subject" class="sr-only">Temat</label>
                            <input type="text" name="subject" id="subject" class="form-control" placeholder="Wpisz temat">
                        </div>
                         <div class="form-group">
                            <textarea class="form-control" name="body" id="body" cols="50" rows="10"></textarea>
                        </div>
                
                        <input type="submit" name="submit" id="btn-login" class="btn btn-primary btn-lg btn-block" value="Wyślij">
                    </form>
                   </div>
                   </div>
                </div>
            </div> <!-- /.col-xs-12 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</section>


        <hr>



<?php include "includes/footer.php";?>
