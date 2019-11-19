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
                
                if(isset($_GET['p_id']))
                {
                    $the_post_id = $_GET['p_id'];
                    $the_post_author = $_GET['author'];
                }
                
                
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
                
                if(isset($_SESSION['user_role']) && $_SESSION['user_role'] = 'admin')
                  {
                      $posts_query_count = "SELECT * FROM posts ";
                      
                  } else {
                      
                      $posts_query_count = "SELECT * FROM posts WHERE post_status = 'published' ";
                  }
                    

                $find_count = mysqli_query($connection, $posts_query_count);
                $count = mysqli_num_rows($find_count);
                
                if($count < 1)
                {
                    echo " <h1 class='text-center'> NO POSTS </h1>";
                    
                }else
                    {
                
                
                
                $count = ceil($count / $per_page);
                
                
                $query = "SELECT * FROM posts LIMIT $page_1, $per_page ";
                $select_all_posts_query = mysqli_query($connection, $query);
                    
                while($row = mysqli_fetch_assoc($select_all_posts_query))
                {
                    $post_title = $row['post_title'];
                    $post_user = $row['post_user'];
                    $post_date = $row['post_date'];
                    $post_image = $row['post_image'];
                    $post_content = $row['post_content'];
                    
                    ?>
                    
                    

                <!-- First Blog Post -->
                <h2>
                    <a href="post/<?php echo $post_id; ?>"><?php echo $post_title ?></a>
                </h2>
                <p class="lead">
                   Wszystkie posty dodane przez:  <?php echo $post_user ?>
                </p>
                <p><span class="glyphicon glyphicon-time"></span> <?php echo $post_date ?></p>
                <hr>
                <img class="img-responsive" src="/cms/images/<?php echo $post_image;?>" alt="">
                <hr>
                <p><?php echo $post_content ?></p>
                <hr>
                    
                <?php
                } }  
                ?>

                   
                <!-- Blog Comments -->

               <?php
                
                if(isset($_POST['create_comment']))
                {
                    $the_post_id = $_GET['p_id'];
                    
                    $comment_author = $_POST['comment_author'];
                    $comment_email = $_POST['comment_email'];
                    $comment_content = $_POST['comment_content'];
                    
                    if(!empty($comment_author) && !empty($comment_email) && !empty($comment_content))
                    {
                        $query = "INSERT INTO comments (comment_post_id, comment_author, comment_email, comment_content, comment_status, comment_date)";
                    
                    $query .= " VALUES ($the_post_id, '{$comment_author}', '{$comment_email}', '{$comment_content}', 'unapproved', now())";
                    
                    $creat_comment_query = mysqli_query($connection, $query);
                    
                    if(!$creat_comment_query)
                    {
                        die('QUERY FAILED' . mysqli_error($connection));
                    }
                    
                    $query = "UPDATE posts SET post_comment_count = post_comment_count + 1 "; 
                    $query .= "WHERE post_id = $the_post_id ";
                    $update_comment_count = mysqli_query($connection, $query);
                    }else
                    {
                        echo "<script>alert('Fields cannot be empty')</script>";
                    }

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
                    echo "<li><a class='active_link' href='author_posts.php?page={$i}'>{$i}</a></li>";
                    
                }else
                {
                    echo "<li><a href='author_posts.php?page={$i}'>{$i}</a></li>";
                }
            }
            ?>
            
            
        </ul>
      
       <?php include "includes/footer.php"; ?>