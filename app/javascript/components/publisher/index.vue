<template>
  <div id="app" class="container-fluid">

    <!-- Breadcrumb -->
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">publishers</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li class="active">Publishers</li>
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
                <input type="text" class="form-control" v-model="keyword" placeholder="Search by Name">
                <span class="input-group-btn">
                  <button type="button" class="btn waves-effect waves-light btn-info" v-on:click="searchPublisher()" style="height:38px;"><i class="fa fa-search"></i></button>
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
                              <th width="70" class="text-center">#</th>
                              <th>NAME</th>
                              <th>PHONE</th>
                              <th>ADDRESS</th>
                              <th>
                                <button type="button" class="btn btn-success btn-circle btn-sm" v-on:click="newPublisher()">
                                <i class="ti-plus"></i></button>
                              </th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr v-for="row in rows" :key="row.publisher_id">
                              <td class="text-center">{{row.publisher_id}}</td>
                              <td>{{row.name}}</td>
                              <td>{{row.phone}}</td>
                              <td>{{row.address}}</td>
                              <td>
                                <a :href="'/#/publishers/'+row.publisher_id" class="btn btn-info btn-circle btn-sm"><i class="ti-info"></i></a>
                                <button type="button" class="btn btn-warning btn-circle btn-sm" v-on:click="editPublisher(row.publisher_id)"><i class="ti-pencil-alt"></i></button>
                                <button type="button" class="btn btn-danger btn-circle btn-sm" v-on:click="deletePublisher(row.publisher_id, row.name)"><i class="ti-trash"></i></button>
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
    <div id="popup-publisher-form" class="modal fade" style="display: none;">
      <div class="modal-dialog modal-lg">
       <div class="modal-content">
          <div class="modal-header">
             <h4 class="modal-title">Add publisher</h4>
          </div>
          <div class="modal-body">
             <div class="row">
                <div class="col-md-12 form-group">
                  <label for="publisher_name" class="control-label col-form-label">Name</label>
                  <input type="text" id="publisher_name" class="form-control" v-model="row.name">
                  <label id="error_name" class="error"></label>
                </div>

                <div class="col-md-12 form-group">
                  <label for="publisher_description" class="control-label col-form-label">Description</label>
                  <textarea id="publisher_description" class="form-control" rows="3" v-model="row.description"></textarea>
                  <label id="error_description" class="error"></label>
                </div>

                <div class="col-md-12 form-group">
                  <div class="row">
                    <div class="col-md-4">
                      <label for="publisher_phone" class="control-label col-form-label">phone</label>
                      <input type="text" id="publisher_phone" class="form-control" v-model="row.phone">
                      <label id="error_phone" class="error"></label>
                    </div>

                    <div class="col-md-8">
                      <label for="publisher_address" class="control-label col-form-label">address</label>
                      <input type="text" id="publisher_address" class="form-control" v-model="row.address">
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
  },
  methods: {
    activeMenu() {
      $('ul#side-menu a').removeClass('active');
      $('ul#side-menu a.menu-publisher').addClass('active');
    },

    initialize() {
      var params = {keyword: this.keyword, page: this.page, per_page: this.per_page };
      return axios
        .get("/api/publishers", { params: params })
        .then(response => {
           this.rows = response.data.data;
           this.total = response.data.total;
         })
        .catch(e => {
           console.log(e);
        });
    },

    searchPublisher() {
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

    newPublisher() {
      this.row = {
        publisher_id: '',
        name: '',
        phone: '',
        address: '',
        description: ''
      };
      $("label.error").html('');
      this.openPopupForm('new');
    },

    editPublisher(publisher_id) {
      return axios
        .get("/api/publishers/" + publisher_id)
        .then(response => {
           this.row = response.data.data;
           $("label.error").html('');
           this.openPopupForm('edit');
         })
        .catch(e => {
           console.log(e);
        });
    },

    deletePublisher(publisher_id, name) {
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
            .delete("/api/publishers/" + publisher_id, { headers: headers })
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
      if(this.row.publisher_id == '')
      {
        axios.post("/api/publishers", { publisher: this.row }, { headers: headers })
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
        axios.put("/api/publishers/" + this.row.publisher_id, { publisher: this.row }, { headers: headers })
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
    },
    
    openPopupForm(action) {
      if(action == 'new')
      {
        $('#popup-publisher-form .modal-title').html("Create Publisher");
        $('#popup-publisher-form .btn-success').html("<i class='fa fa-save'></i> Submit");
      }
      else
      {
        $('#popup-publisher-form .modal-title').html("Update Publisher");
         $('#popup-publisher-form .btn-success').html("<i class='fa fa-save'></i> Update");
      }
      $("#popup-publisher-form").modal();
    },

    closePopupForm: function() {
      $("#popup-publisher-form").modal('hide');
    }
  }
};
</script>