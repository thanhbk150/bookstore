<template>
  <div id="app" class="container-fluid">
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Author Details</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li><a href="/#/authors">Authors</a></li>
            <li class="active">{{row.first_name}}</li>
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
                              <td width="300">First Name</td>
                              <td>{{row.first_name}}</td>
                          </tr>
                          <tr>
                              <td>Last Name</td>
                              <td> {{row.last_name}} </td>
                          </tr>
                          <tr>
                              <td>Gender</td>
                              <td> {{row.gender ? 'Male' : 'Female' }} </td>
                          </tr>
                          <tr>
                              <td>Biography</td>
                              <td> {{row.biography}} </td>
                          </tr>
                          <tr>
                              <td>Email</td>
                              <td> {{row.email}} </td>
                          </tr>
                          <tr>
                              <td>Phone</td>
                              <td> {{row.phone}} </td>
                          </tr>
                          <tr>
                              <td>Address</td>
                              <td> {{row.address}}</td>
                          </tr>
                          
                      </tbody>
                      <tfoot>
                        <tr>
                          <td colspan="2" class="text-center">
                            <a href="/#/authors" class="btn btn-outline btn-default"><i class="fa fa-list"></i> Back to list</a>
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
      $('ul#side-menu a.menu-author').addClass('active');
    },

    initialize() {
      var author_id = this.$route.params.id;
      return axios
        .get("http://localhost:3000/api/authors/" + author_id)
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