<?php 

    if(ifItIsMethod('post'))
    {
        if(isset($_POST['login']))
        {
            if(isset($_POST['username']) && isset($_POST['password']))
        {
            login_user($_POST['username'], $_POST['password']);
        }else
        {
            redirect('index');
        }
            
        }
    }

?>
               
 <div class="col-md-4">
               
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>Wyszukaj swoją wymarzoną ofertę</h4>
                    <form action="search.php" method="post">
                        <div class="input-group">
                            <input name="search" type="text" class="form-control">
                            <span class="input-group-btn">
                                <button name="submit" class="btn btn-default" type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                            </button>
                            </span>
                        </div>
                    </form>
                    <!-- /.input-group -->
                </div>
                
                <!-- Login -->
                <div class="well">
                   
                   <?php if(isset($_SESSION['user_role'])): ?>
                   
                   <h4>Zalogowany/a jako <?php echo $_SESSION['username'] ?></h4>
                   <a href="/cms/includes/logout.php" class="btn btn-primary">Wyloguj</a>
                   <?php else: ?>
                   
                       <h4>Zaloguj się </h4>
                    <form  method="post">
                        <div class="form-group">
                            <input name="username" type="text" class="form-control" placeholder="Wpisz login">
                        </div>
                        <div class="input-group">
                            <input name="password" type="password" class="form-control" placeholder="Wpisz hasło">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" name="login" type="submit">Zaloguj się
                                </button>
                            </span>
                        </div>
                        
                        <div class="form-group">
                            <a href="forgot.php?forgot=<?php echo uniqid(true); ?>">Zapomniałeś/aś hasła?</a>
                        </div>
                        
                    </form>
                    <!-- /.input-group -->
                   
                   <?php endif; ?>
                   
                    
                </div>

               
               
                <!-- Blog Categories Well -->
                <div class="well">
                   
                   <?php
                    
                    $query = "SELECT * FROM categories ";
                    $select_categories_sidebar = mysqli_query($connection, $query);
                
                    ?>
                   
                    <h4>Kategorie Wycieczek</h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="list-unstyled">
                               
                               <?php
                                
                                while($row = mysqli_fetch_assoc($select_categories_sidebar))
                                {
                                    $cat_title = $row['cat_title'];
                                    $cat_id = $row['cat_id'];

                                    echo "<li><a href='category.php?category=$cat_id'>{$cat_title}</a></li>";
                                }
                                
                                ?>
                            </ul>
                        </div>
                        
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <?php include "widget.php"; ?>

            </div>