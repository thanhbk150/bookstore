<template>
  <div id="app" class="container-fluid">
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Book Details</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li><a href="/#/books">Books</a></li>
            <li class="active">{{row.title}}</li>
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
                              <td width="300">Title</td>
                              <td>{{row.title}}</td>
                          </tr>
                          <tr>
                              <td>Category</td>
                              <td>{{row.category_name}}</td>
                          </tr>
                          <tr>
                              <td>Author</td>
                              <td> {{row.author_name}} </td>
                          </tr>
                          <tr>
                              <td>Publisher</td>
                              <td> {{row.publisher_name}} </td>
                          </tr>
                          <tr>
                              <td>Edition Number</td>
                              <td> {{row.edition_number}} </td>
                          </tr>
                          <tr>
                              <td>Copyright</td>
                              <td> {{row.copyright}}</td>
                          </tr>

                          <tr>
                              <td>Description</td>
                              <td> {{row.description}}</td>
                          </tr>

                          <tr>
                              <td>Price</td>
                              <td> {{row.price}}</td>
                          </tr>
                          
                      </tbody>
                      <tfoot>
                        <tr>
                          <td colspan="2" class="text-center">
                            <a href="/#/books" class="btn btn-outline btn-default"><i class="fa fa-list"></i> Back to list</a>
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
      $('ul#side-menu a.menu-book').addClass('active');
    },

    initialize() {
      var book_id = this.$route.params.id;
      return axios
        .get("http://localhost:3000/api/books/" + book_id)
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