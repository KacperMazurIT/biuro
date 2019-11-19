 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">Panel
                             <?php  if(is_admin()){
                             echo "Administratora";
                            }else{ 
                            echo"Klienta"; } ?></a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
              
                <li><a href="">Użytkownicy Online: <span class="usersonline"></span></a></li>
              
               <li><a href="../index.php">Strona główna</a></li>
               
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>
                     <?php
                     if(isset($_SESSION['username']))
                     {
                         echo $_SESSION['username'];
                     }
                     
                     ?>
                     <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="profile.php"><i class="fa fa-fw fa-user"></i> Profil</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="../includes/logout.php"><i class="fa fa-fw fa-power-off"></i> Wyloguj się</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="index.php"><i class="fa fa-fw fa-dashboard"></i> Moje dane</a>
                    </li>
                    
                    <?php  if(is_admin()):?>
                    
                     <li>
                        <a href="dashboard.php"><i class="fa fa-fw fa-bar-chart-o"></i> Pulpit</a>
                    </li>
                    
                    <?php endif ?>
                    
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#posts_dropdown"><i class="fa fa-fw fa-arrows-v"></i> Oferty <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="posts_dropdown" class="collapse">
                           <?php  if(is_admin()){?>
                            <li>
                                <a href="./posts.php"> Wyświetl wszystkie oferty </a>
                            </li>
                            <li>
                                <a href="posts.php?source=add_post">Dodaj ofertę</a>
                            </li>
                            <?php }else{ ?>
                            <li>
                                <a href="../index.php"> Wyświetl wszystkie oferty </a>
                            </li>
                            <?php }?>
                        </ul>
                    </li>
                    <?php  if(is_admin()){?>
                    <li>
                        <a href="./categories.php"><i class="fa fa-fw fa-wrench"></i> Kategorie wycieczek </a>
                    </li>
                    <?php  }else{?>
                    
                     <li>
                        <a href="../index.php"><i class="fa fa-fw fa-wrench"></i> Kategorie wycieczek </a>
                    </li>
                    
                    <?php } if(is_admin()):?>
                    <li class="">
                        <a href="comments.php"><i class="fa fa-fw fa-file"></i> Komentarze </a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Użytkownicy <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="users.php">Wyświetl wszystkich użytkowników</a>
                            </li>
                            <li>
                                <a href="users.php?source=add_user">Dodaj użytkownika</a>
                            </li>
                        </ul>
                    </li>
                    <?php endif ?>
                    <li>
                    
                            <a href="profile.php"><i class="fa fa-fw fa-dashboard"></i> Mój Profil </a>
                            </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>