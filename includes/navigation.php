<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
           
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav ">
              
                      <li>
                        <a href="/cms/index" class="nav"> Strona główna</a>
                     </li>
                     <li>
                        <a href="/cms/all_posts" class="nav">Wszystkie oferty</a>
                     </li>

                      <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>
                                 Kategorie wycieczek
                                 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                   <?php

                                        $query = "SELECT * FROM categories";
                                        $select_all_categories_query = mysqli_query($connection, $query);

                                        while($row = mysqli_fetch_assoc($select_all_categories_query))
                                        {
                                            $cat_title = $row['cat_title'];
                                            $cat_id = $row['cat_id'];

                                            $category_class = '';

                                            $registration_class = '';

                                            $pageName = basename($_SERVER['PHP_SELF']);

                                            $registration = 'registration.php';

                                            if(isset($_GET['category']) && $_GET['category'] == $cat_id)
                                            {
                                                $category_class = 'active';

                                            }else if($pageName == $registration)
                                            {
                                                $registration_class = 'active';
                                            }


                                            echo "<li class='$category_class'><a href='/cms/category/{$cat_id}' class='nav'>{$cat_title}</a></li>";

                                        }                
                                        ?>
                                </ul>
                            </li>
                    </ul>
                <ul class="nav navbar-nav navbar-right">
                 
                 
                        <?php if(isLoggedIn()):  ?>      
                          
                        <li>
                            <a href="/cms/admin">
                             <?php  if(is_admin()){
                             echo "Panel Admina";
                            }else{ 
                                echo"Panel Klienta"; 
                                } ?></a>
                        </li>
                        
                        <li>
                            <a href="/cms/includes/logout.php" class='nav'>Wyloguj się</a>
                        </li>
                           
                        <?php else: ?>    
                 
                        <li>
                            <a href="/cms/login" class='nav'>Zaloguj się</a>
                        </li>   
                        
                        <li >
                            <a href="/cms/registration" class='nav'>Zarejestruj się</a>
                        </li>
                        <?php endif; ?>
                    
                    <?php if(!is_admin()): ?>
                     <li>
                        <a href="/cms/contact" class='nav'>Kontakt</a>
                    </li>
                     <?php endif?>
                   <?php 

    if(isset($_SESSION['user_role'])) {
    
        if(isset($_GET['p_id'])) {
            
          $the_post_id = $_GET['p_id'];
        
        echo "<li><a href='/cms/admin/posts.php?source=edit_post&p_id={$the_post_id}'>Edytuj ofertę</a></li>";
        
        }
    }
    
    ?>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>