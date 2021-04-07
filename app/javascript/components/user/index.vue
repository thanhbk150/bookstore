<template>
  <div id="app" class="container-fluid">

    <!-- Breadcrumb -->
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Users</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li class="active">Users</li>
        </ol>
      </div>
    </div>
    
    <!-- Listing -->
    <div class="row">
      <div class="col-md-12">
        <div class="white-box">

          <!-- Search -->
          <div class="row">
            <div class="col-md-4">
              <div class="input-group">
                <input type="text" class="form-control" v-model="keyword" placeholder="Search by Name or Email">
                <span class="input-group-btn">
                  <button type="button" class="btn waves-effect waves-light btn-info" v-on:click="searchUser()" style="height:38px;"><i class="fa fa-search"></i></button>
                </span>
              </div>
            </div>
            <div class="col-md-2" style="padding-top:8px;" v-show="keyword != ''">
              <a href="javascript:void()" v-on:click="resetSearch()">Clear</a>
            </div>
          </div>   

          <!-- Table -->
          <div class="panel">
              <div class="table-responsive">
                  <table class="table table-hover manage-u-table">
                      <thead>
                          <tr>
                              <th width="70" class="text-center">ID</th>
                              <th>FIRST NAME</th>
                              <th>LAST NAME</th>
                              <th>EMAIL</th>
                              <th>PHONE</th>
                              <th>ADDRESS</th>
                              <th>
                                <button type="button" class="btn btn-success btn-circle btn-sm" v-on:click="newUser()">
                                <i class="ti-plus"></i></button>
                              </th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr v-for="row in rows" :key="row.user_id">
                            <td class="text-center">{{row.user_id}}</td>
                            <td>{{row.first_name}}</td>
                            <td>{{row.last_name}}</td>
                            <td>{{row.email}}</td>
                            <td>{{row.phone}}</td>
                            <td>{{row.address}}</td>
                            <td>
                              <a :href="'/#/users/'+row.user_id" class="btn btn-info btn-circle btn-sm"><i class="ti-info"></i></a>
                              <button type="button" class="btn btn-warning btn-circle btn-sm" v-on:click="editUser(row.user_id)"><i class="ti-pencil-alt"></i></button>
                              <button type="button" class="btn btn-danger btn-circle btn-sm" v-on:click="deleteUser(row.user_id, row.first_name)"><i class="ti-trash"></i></button>
                            </td>
                          </tr>
                          <tr v-show="rows.length == 0">
                            <td colspan="9">No data</td>
                          </tr>
                      </tbody>
                      <tfoot>
                        <tr v-if="total > 0">
                          <td colspan="10">
                            Total: <b>{{total}}</b>
                          </td>
                        </tr>
                        <tr v-if="total_page > 1">
                          <td colspan="10" class="text-center">
                              <ul class="pagination text-center">
                                 <li class="page-item page-pre">
                                      <a class="page-link" href="javascript:void(0)" @click.prevent="setPage(1)">‹‹</a>
                                  </li>
                                  <li class="page-item" v-for="n in total_page" :key="'pagination_'+n" v-bind:class="{ 'active': n == page }">
                                      <a class="page-link" href="javascript:void(0)" @click.prevent="setPage(n)" > {{n}} </a>
                                  </li>
                                  <li class="page-item page-next">
                                      <a class="page-link" href="javascript:void(0)" @click.prevent="setPage(total_page)">››</a>
                                  </li>
                              </ul>
                          </td>
                        </tr>
                      </tfoot>
                  </table>
              </div>
          </div>

        </div>
      </div>
    </div>

    <!-- Popup -->
    <div id="popup-user-form" class="modal fade" style="display: none;">
      <div class="modal-dialog modal-lg">
       <div class="modal-content">
          <div class="modal-header">
             <h4 class="modal-title">Add User</h4>
          </div>
          <div class="modal-body">
             <div class="row">
              <div class="col-md-12 form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label for="user_first_name" class="control-label col-form-label">First Name *</label>
                      <input type="text" id="user_first_name" class="form-control" v-model="row.first_name">
                      <label id="error_first_name" class="error"></label>
                    </div>

                    <div class="col-md-6">
                      <label for="user_last_name" class="control-label col-form-label">Last Name *</label>
                      <input type="text" id="user_last_name" class="form-control" v-model="row.last_name">
                      <label id="error_last_name" class="error"></label>
                    </div>
                  </div>
                </div>

                <div class="col-md-12 form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label for="user_email" class="control-label col-form-label">Email *</label>
                      <input type="text" id="user_email" class="form-control" v-model="row.email">
                      <label id="error_email" class="error"></label>
                    </div>  
                    <div class="col-md-4">
                      <label for="user_password" class="control-label col-form-label">Password</label>
                      <input type="text" id="user_password" class="form-control" v-model="row.password">
                      <label id="error_password" class="error"></label>
                    </div>
                  </div>
                </div>
                
                    
                <div class="col-md-12 form-group">
                  <div class="row">
                    <div class="col-md-4 form-group">
                      <label for="user_phone" class="control-label col-form-label">Phone</label>
                      <input type="text" id="user_phone" class="form-control" v-model="row.phone">
                      <label id="error_phone" class="error"></label>
                    </div>

                    <div class="col-md-8 form-group">
                      <label for="user_address" class="control-label col-form-label">Address</label>
                      <input type="text" id="user_address" class="form-control" v-model="row.address">
                      <label id="error_address" class="error"></label>
                    </div>
                  </div>
                </div>
                  
              </div>
          </div>
          <div class="modal-footer text-center">
            <button type="button" class="btn btn-success" v-on:click="submitForm()"><i class="fa fa-save"></i> Submit</button>
            <button type="button" class="btn btn-default" v-on:click="closePopupForm()"><i class="fa fa-times-circle"></i> Close</button>
          </div>
       </div>
      </div>
    </div>
  </div>  
</template>

<script>
  import axios from "axios";
  const headers = {};

  export default {
    data: () => ({
      keyword: '',
      page: 1,
      per_page: 10,
      rows: [],
      total: 0,
      row: {},
    }),
    computed: {
      total_page() {
        return Math.ceil(this.total/this.per_page);
      }
    },
    watch: {
      per_page: function(new_value, old_value) {
        this.initialize();
      },
      page: function(new_value, old_value) {
        this.initialize();
      },
    },
    created() {
      this.activeMenu();
      this.initialize();
    },
    mounted() {
      headers['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
      // Validation
      /*
      $('#popup-user-form').validate({
          ignore: '',
          rules: {
              last_name: "required",
              first_name: "required",
              email: {
                required: true,
                email: true
              }
             
          },
          messages: {
              last_name: "Last Name can't be blank!",
              first_name: "First Name can't be blank!",
              email: {
                required: "Email can't be blank!",
                email: 'Email is invalid!'
              }
              
          }
      });
      */
    },
    methods: {
      activeMenu() {
        $('ul#side-menu a').removeClass('active');
        $('ul#side-menu a.menu-user').addClass('active');
      },

      initialize() {
        var params = {keyword: this.keyword, page: this.page, per_page: this.per_page };
        return axios
          .get("/api/users", { params: params })
          .then(response => {
             this.rows = response.data.data;
              this.total = response.data.total;
           })
          .catch(e => {
             console.log(e);
          });
      },

      searchUser() {
        this.page = 1;
        this.initialize();
      },

      resetSearch() {
        this.keyword = '';
        this.page = 1;
        this.initialize();
      },

      setPage(n) {
        this.page = n;
        $('html,body').animate({scrollTop:150}, 500);
      },

      newUser() {
        this.row = {
          user_id: '',
          first_name: '',
          last_name: '',
          email: '',
          phone: '',
          address: '',
          password: ''
        };
        $("label.error").html('');
        this.openPopupForm('new');
      },

      editUser(user_id) {
        return axios
          .get("/api/users/" + user_id)
          .then(response => {
             this.row = response.data.data;
             $("label.error").html('');
             this.openPopupForm('edit');
           })
          .catch(e => {
             console.log(e);
          });
      },

      deleteUser(user_id, name) {
        var self = this;
        this.$swal({
          title: "Delete " + name,   
          text: "Are you sure?",   
          type: "warning",   
          showCancelButton: true,   
          confirmButtonColor: "#DD6B55",   
          confirmButtonText: "OK",   
          cancelButtonText: "Cancel"
        }).then(function(confirm) {
          if(confirm.value)
          {
             return axios
              .delete("/api/users/" + user_id, { headers: headers })
              .then(response => {
                if(response.data.status == 'ok')
                {
                  self.$swal(response.data.message, "", "success");
                  self.initialize();
                }
                else
                {
                  self.$swal("Faild", response.data.errors, "warning");
                }
              })
              .catch(e => {
                console.log(e);
              });
          }
        });
      },

      submitForm() {
        //if($('#popup-user-form').valid())
        //{
          if(this.row.user_id == '')
          {
            axios.post("/api/users", { user: this.row }, { headers: headers })
              .then(response => {
                if(response.data.status == 'ok')
                {
                  this.initialize();
                  this.closePopupForm();
                }
                else
                {
                  $("label.error").html('');
                  $.each(response.data.errors, function(key, value){
                    $("label#error_" + key).html(value.join(', '));
                  });
                }
              })
              .catch(error => {
               console.log(error);
            });
          }
          else
          {
            axios.put("/api/users/" + this.row.user_id, { user: this.row }, { headers: headers })
              .then(response => {
                if(response.data.status == 'ok')
                {
                  this.initialize();
                  this.closePopupForm();
                }
                else
                {
                  $("label.error").html('');
                  $.each(response.data.errors, function(key, value){
                    $("label#error_" + key).html(value.join(', '));
                  });
                }
              })
              .catch(error => {
               console.log(error);
            });
          }
        //}
      },
      
      openPopupForm(action) {
        if(action == 'new')
        {
          $('#popup-user-form .modal-title').html("Create user");
          $('#popup-user-form .btn-success').html("<i class='fa fa-save'></i> Submit");
        }
        else
        {
          $('#popup-user-form .modal-title').html("Update user");
           $('#popup-user-form .btn-success').html("<i class='fa fa-save'></i> Update");
        }
        $("#popup-user-form").modal();
      },

      closePopupForm: function() {
        $("#popup-user-form").modal('hide');
      }


    }
  };
</script>