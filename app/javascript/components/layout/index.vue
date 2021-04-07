<template>
  <div id="wrapper">
      <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <a class="logo" href="/#/">
                        <img src="images/logo.png" alt="home" class="light-logo" width="139">
                     </a>
                </div>

                <ul class="nav navbar-top-links navbar-right pull-right active">
                    <li class="dropdown">
                        <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="javascript:void(0)" aria-expanded="false"> 
                        <img src="images/user.png" alt="user-img" width="36" class="img-circle">
                          <b class="hidden-xs current_user_name">Steave</b><span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-user animated flipInY">
                            <li>
                                <div class="dw-user-box">
                                    <div class="u-img"><img src="images/user.png" alt="user"></div>
                                    <div class="u-text">
                                        <h4 class="current_user_name">Steave Jobs</h4>
                                        <p class="text-muted current_user_email"></p>
                                    </div>
                                </div>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li><a href="javascript:void(0)" v-on:click="signOut()"><i class="fa fa-power-off"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
      </nav>
      <div class="navbar-default sidebar" role="navigation">
         <div class="sidebar-nav">
            <div class="sidebar-head">
               <h3><span class="fa-fw open-close"><i class="ti-menu hidden-xs"></i><i class="ti-close visible-xs"></i></span> <span class="hide-menu">Navigation</span></h3>
            </div>
            <ul class="nav" id="side-menu">
              <li>
                <a href="/#/" class="waves-effect menu-dashboard">
                   <i class="mdi mdi-av-timer fa-fw" data-icon="v"></i> <span class="hide-menu"> Dashboard </span>
                </a>
              </li>
              <li>
                <a href="/#/users" class="waves-effect menu-user">
                  <i class="mdi mdi-account-multiple fa-fw" data-icon="v"></i> <span class="hide-menu"> Users </span> 
                </a>
              </li>
              <li>
                <a href="/#/authors" class="waves-effect menu-author">
                  <i class="mdi mdi-account fa-fw" data-icon="v"></i> <span class="hide-menu"> Authors </span>
                </a>
              </li>

              <li>
                <a href="javascript:void(0)" class="waves-effect menu-book">
                   <i class="mdi mdi-book-open fa-fw" data-icon="v"></i> <span class="hide-menu"> Books </span>
                </a>
                <ul class="nav nav-second-level">
                   <li> <a href="/#/book_categories" class=""> <span class="hide-menu">Categories</span></a> </li>
                   <li> <a href="/#/books" class=""> <span class="hide-menu">Books</span></a> </li>
                </ul>
              </li>
              <li>
                <a href="/#/publishers" class="waves-effect menu-publisher">
                   <i class="mdi mdi-home fa-fw" data-icon="v"></i> <span class="hide-menu"> Publishers </span>
                </a>
              </li>
            </ul>
         </div>
      </div>
      <div id="page-wrapper">
          <transition>
            <router-view></router-view>
          </transition>
          <footer class="footer text-center"> 2021 © Thanh Nguyen </footer>
      </div>
  </div>
</template>

<script>
  import axios from "axios";
  const headers = {};

  export default {
    metaInfo: {
      title: 'Book Store',
      htmlAttrs: {
        lang: 'en',
        amp: true
      },
      link: [
        { rel: 'stylesheet', href: "css/bootstrap.min.css"},
        { rel: 'stylesheet', href: "css/sidebar-nav.min.css"},
        { rel: 'stylesheet', href: "css/animate.css"},
        { rel: 'stylesheet', href: "css/style.css"},
        { rel: 'stylesheet', href: "css/megna-dark.css"}
      ],
      script: [
        { src: 'js/bootstrap.min.js', body: true },
        { src: "js/sidebar-nav.min.js", body: true },
        { src: "js/jquery.slimscroll.js", body: true },
        { src: "js/waves.js", body: true },
        { src: "js/custom.js", body: true }
      ]
    },
    data: () => ({
      
    }),
    computed: {
      
    },
    watch: {
      
    },
    created() {
      this.activeMenu();
      this.initialize();
    },

    mounted() {
      headers['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
    },

    methods: {
      activeMenu() {
        $('ul#side-menu a').removeClass('active');
        $('ul#side-menu a.menu-dashboard').addClass('active');
      },

      initialize() {
        return axios
          .get("/api/login_user")
          .then(response => {
             $('.current_user_name').html(response.data.first_name);
             $('.current_user_email').html(response.data.email);
           })
          .catch(e => {
             console.log(e);
          });
      },
      signOut() {
        return axios
          .delete("/users/sign_out", { headers: headers })
          .then(response => {
             window.location.href = "/";
           })
          .catch(e => {
             console.log(e);
             window.location.href = "/";
          });
      }
    }
  };
</script>