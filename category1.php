
 <?php include "includes/db.php";?>

    <?php include "includes/header.php";?>

    <!-- Navigation -->

    <?php include "includes/navigation.php";?>

    <!-- Page Content -->

    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->

            <div class="col-md-8">

               <?php

                $per_page = 5;  

                if(isset($_GET['page']))

                {

                   

                    $page = $_GET['page'];

                }else

                {

                    $page = "";

                }     

                if($page == "" || $page == 1)

                {

                    $page_1 = 0;

                } else

                {

                    $page_1 = ($page * $per_page) - $per_page;

                }
               

                if(isset($_GET['category']))

                {

                    $post_category_id =  $_GET['category'];

               

                    if(isset($_SESSION['username']) && is_admin($_SESSION['username']) )

                      {

                            $posts_query_count = "SELECT post_id, post_title, post_user, post_date, post_image, post_content FROM posts WHERE post_category_id = ? ";

                               

                          $stmt1 = mysqli_prepare($connection, $posts_query_count );


                      } else {



                        $posts_query_count = "SELECT post_id, post_title, post_user, post_date, post_image, post_content FROM posts WHERE post_category_id = ? AND post_status = ? ";

                           

                          $stmt2 = mysqli_prepare($connection, $posts_query_count);

                       

                          $published = 'published';
         

                      }

                   

                    if(isset($_SESSION['user_role']) && $_SESSION['user_role'] = 'admin')

                  {

                      $posts_query_count = "SELECT * FROM posts WHERE post_category_id = {$post_category_id} ";

                     

                  } else {

                      $posts_query_count = "SELECT * FROM posts WHERE post_category_id = {$post_category_id} AND post_status = 'published' ";

                  }


                    $find_count = mysqli_query($connection, $posts_query_count);

                    $count = mysqli_num_rows($find_count);
                    echo $count;


                    if($count < 1)

                    {

                        echo " <h1 class='text-center'> NO POSTS </h1>";

                    }else

                    {
                     $count = ceil($count / $per_page);

                   
                    if(isset($stmt1))

                    {

                        mysqli_stmt_bind_param($stmt1, "i", $post_category_id);



                        mysqli_stmt_execute($stmt1);



                        mysqli_stmt_bind_result($stmt1, $post_id, $post_title, $post_author, $post_date, $post_image, $post_content );

                        $stmt = $stmt1;

                    }else

                    {

                         mysqli_stmt_bind_param($stmt2, "is", $post_category_id, $published);

                        mysqli_stmt_execute($stmt2);
                        mysqli_stmt_bind_result($stmt2, $post_id, $post_title, $post_author, $post_date, $post_image, $post_content );

                        $stmt = $stmt2;

                    }

                        $query = "SELECT * FROM posts  LIMIT $page_1, $per_page ";

                        $select_all_posts_query = mysqli_query($connection, $query);

                   
                        while(mysqli_stmt_fetch($stmt))

                        {

                        ?>

                        <!-- First Blog Post -->

                        <h2>

                            <a href="../post.php?p_id=<?php echo $post_id; ?>"><?php echo $post_title ?></a>

                        </h2>

                        <p class="lead">

                            Dodano przez <a href="../author_posts.php?author=<?php echo $post_author ?>&p_id=<?php echo $post_id; ?>"><?php echo $post_author ?></a>

                        </p>

                        <p><span class="glyphicon glyphicon-time"></span> <?php echo $post_date ?></p>

                        <hr>

                        <img class="img-responsive" src="/cms/images/<?php echo $post_image;?>" alt="">

                        <hr>

                        <p><?php echo $post_content ?></p>

                        <a class="btn btn-primary" href="../post.php?p_id=<?php echo $post_id; ?>">Dowiedz się więcej <span class="glyphicon glyphicon-chevron-right"></span></a>



                        <hr>



                        <?php

                        } } } else{

                                header("Location: index.php");

                                }

                    ?>

            </div>



            <!-- Blog Sidebar Widgets Column -->

           

           <?php include "includes/sidebar.php"; ?>



        </div>

        <!-- /.row -->



        <hr>



           <ul class="pager">

         

            <?php

           

            for($i = 1; $i <= $count; $i++)

            {

               

                if($i == $page)

                {

                    echo "<li><a class='active_link' href='../category?page={$i}'>{$i}</a></li>";

                }else

                {

                    echo "<li><a href='../category?page={$i}'>{$i}</a></li>";
                }

            }

               

            ?>

            </ul>



     

       <?php include "includes/footer.php"; ?>