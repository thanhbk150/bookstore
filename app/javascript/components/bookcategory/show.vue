<template>
  <div id="app" class="container-fluid">
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Book Category Details</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li><a href="/#/book_categories">Book Category</a></li>
            <li class="active">{{row.name}}</li>
        </ol>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="white-box">
            <div class="panel">
                <div class="table-responsive">
                  <table class="table" v-show="row">
                      <tbody>
                          <tr>
                              <td width="300"> Name</td>
                              <td>{{row.name}}</td>
                          </tr>
                          <tr>
                              <td>Description</td>
                              <td> {{row.description}} </td>
                          </tr>
                          <tr>
                              <td>Book Total</td>
                              <td> {{row.total_book}} </td>
                          </tr>
                         
                          
                      </tbody>
                      <tfoot>
                        <tr>
                          <td colspan="2" class="text-center">
                            <a href="/#/book_categories" class="btn btn-outline btn-default"><i class="fa fa-list"></i> Back to list</a>
                          </td>
                        </tr>
                      </tfoot>
                  </table>
              </div>
            </div>
          </div>  
        </div>
      </div>
    </div>  
  </div>
</template>

<script>
  import axios from "axios";
  export default {
    data: () => ({
      row: {},

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
      $('ul#side-menu a.menu-book-category').addClass('active');
    },

    initialize() {
      var book_category_id = this.$route.params.id;
      return axios
        .get("http://localhost:3000/api/book_categories/" + book_category_id)
        .then(response => {
           this.row = response.data.data;
         })
        .catch(e => {
           console.log(e);
        });
    },
  }
};
</script>  