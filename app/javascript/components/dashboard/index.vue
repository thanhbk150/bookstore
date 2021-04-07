<template>
  <div id="app" class="container-fluid">
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Dashboard</h4>
      </div>
      
    </div>

    <div class="row">
          <div class="col-lg-3 col-sm-6 col-xs-12">
              <div class="white-box">
                  <h3 class="box-title">USERS</h3>
                  <ul class="list-inline two-part">
                      <li><i class="icon-people text-info"></i></li>
                      <li class="text-right"><span class="counter">{{summaries.user}}</span></li>
                  </ul>
              </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-xs-12">
              <div class="white-box">
                  <h3 class="box-title">AUTHORS</h3>
                  <ul class="list-inline two-part">
                      <li><i class="icon-user text-purple"></i></li>
                      <li class="text-right"><span class="counter">{{summaries.author}}</span></li>
                  </ul>
              </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-xs-12">
              <div class="white-box">
                  <h3 class="box-title">BOOKS</h3>
                  <ul class="list-inline two-part">
                      <li><i class="ti-book text-danger"></i></li>
                      <li class="text-right"><span class="">{{summaries.book}}</span></li>
                  </ul>
              </div>
          </div>
          <div class="col-lg-3 col-sm-6 col-xs-12">
              <div class="white-box">
                  <h3 class="box-title">PUBLISHERS</h3>
                  <ul class="list-inline two-part">
                      <li><i class="ti-home text-success"></i></li>
                      <li class="text-right"><span class="">{{summaries.publisher}}</span></li>
                  </ul>
              </div>
          </div>
      </div>
  </div>  
</template>

<script>
  import axios from "axios";
  export default {
    data: () => ({
      dialog: false,
      summaries: {user: 0, author: 0, book: 0, publisher: 0},

  }),
  computed: {
    
  },
  watch: {
    
  },
  created() {
    this.activeMenu();
    this.initialize();
  },
  methods: {
    activeMenu() {
      $('ul#side-menu a').removeClass('active');
      $('ul#side-menu a.menu-dashboard').addClass('active');
    },

    initialize() {
      return axios
        .get("http://localhost:3000/api/summaries")
        .then(response => {
           this.summaries = response.data;
         })
        .catch(e => {
           console.log(e);
        });
    },
   

  }
};
</script>