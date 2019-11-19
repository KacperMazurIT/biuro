<?php include "includes/admin_header.php" ?>
<?php $post_counts = count_records(get_all_user_posts()); 
      $comment_counts = count_records(get_all_posts_user_comments());
      $category_counts =  count_records(get_all_user_categories());
      $post_published_count = count_records(get_all_user_published_posts());
      $post_draft_count = count_records(get_all_user_draft_posts());
      $approved_comment_count = count_records(get_all_user_approved_posts_comments());
      $unapproved_comment_count = count_records(get_all_user_unapproved_posts_comments());
             
?>
    <div id="wrapper">

        <!-- Navigation -->
       <?php include "includes/admin_navigation.php" ?>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                       
                       
                        <h1 class="page-header">
                            Witaj w panelu
                             <?php  if(is_admin()){
                             echo "Administratora";
                            }else{ 
                            echo"Klienta"; } ?>
                            <small><?php echo $_SESSION['username']; ?></small>
                        </h1>
                        
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file-text fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                    <div class='huge'><?php echo $post_counts = recordCount('posts'); ?></div>
                                        <div>Oferty</div>
                                    </div>
                                </div>
                            </div>
                            <a href="../index.php">
                                <div class="panel-footer">
                                    <span class="pull-left">Wyświetl Szczegóły</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-list fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                       <div class='huge'><?php echo $category_counts = recordCount('categories'); ?></div>
                                         <div>Kategorie</div>
                                    </div>
                                </div>
                            </div>
                            <a href="../index.php">
                                <div class="panel-footer">
                                    <span class="pull-left">Wyświetl Szczegóły</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                
                
               <?php 
                $post_published_count = checkStatus('posts', 'post_status', 'published');
                $post_draft_count = checkStatus('posts', 'post_status', 'draft');
                ?>
                
                
                
                
                <div class="row">
                    <script type="text/javascript">
                      google.charts.load('current', {'packages': ['bar']});
                      google.charts.setOnLoadCallback(drawChart);

                      function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                          ['Dane', 'Liczba'],
                            
                            <?php
                            
                            $elements_text = ['Wszystkie  oferty','Aktywne oferty', 'Niekatywne oferty',  'Kategorie Wycieczek'];
                            $elements_count = [$post_counts, $post_published_count, $post_draft_count,  $category_counts];
                            
                            for($i = 0; $i < 4; $i++)
                            {
                                echo "['{$elements_text[$i]}'". "," ."{$elements_count[$i]}],";
                            }
                            
                            ?>
                        ]);

                        var options = {
                          chart: {
                            title: '',
                            subtitle: '',
                          }
                        };

                        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                        chart.draw(data, google.charts.Bar.convertOptions(options));
                      }
                    </script>
                    <div class="center"  id="columnchart_material" style=" max-width: 1000px; height: 500px; "></div>
                </div>
           
           
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
<?php include "includes/admin_footer.php" ?>

<script src="https://js.pusher.com/5.0/pusher.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>
        
        $(document).ready(function()
        {
                          
        var pusher = new Pusher('ce74949131b1cb15542a', {
            
            cluster: 'eu',
            encrypted: true
        });
                          
        var notificationChannel =  pusher.subscribe('notifications');


                notificationChannel.bind('new_user', function(notification){

                    var message = notification.message;

                    toastr.success(`${message} just registered`);

                });



            });

        
        
        
        
</script>


























