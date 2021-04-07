<template>
  <div id="app" class="container-fluid">

    <!-- Breadcrumb -->
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Book Category</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li class="active">Book Category</li>
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
                  <button type="button" class="btn waves-effect waves-light btn-info" v-on:click="searchBookCategory()" style="height:38px;"><i class="fa fa-search"></i></button>
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
                              <th>Total Book</th>
                              <th>
                                <button type="button" class="btn btn-success btn-circle btn-sm" v-on:click="newBookCategory()">
                                <i class="ti-plus"></i></button>
                              </th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr v-for="row in rows" :key="row.book_category_id">
                              <td class="text-center">{{row.book_category_id}}</td>
                              <td>{{row.name}}</td>
                              <td>{{row.total_book}}</td>
                              <td>
                                <a :href="'/#/book_categories/'+row.book_category_id" class="btn btn-info btn-circle btn-sm"><i class="ti-info"></i></a>
                                <button type="button" class="btn btn-warning btn-circle btn-sm" v-on:click="editBookCategory(row.book_category_id)"><i class="ti-pencil-alt"></i></button>
                                <button type="button" class="btn btn-danger btn-circle btn-sm" v-on:click="deleteBookCategory(row.book_category_id, row.name)"><i class="ti-trash"></i></button>
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
    <div id="popup-book-category-form" class="modal fade" style="display: none;">
      <div class="modal-dialog modal-lg">
       <div class="modal-content">
          <div class="modal-header">
             <h4 class="modal-title">Add BookCategory</h4>
          </div>
          <div class="modal-body">
             <div class="row">
                <div class="col-md-12 form-group">
                  <label for="book_category_name" class="control-label col-form-label">Name</label>
                  <input type="text" id="book_category_name" class="form-control" v-model="row.name">
                  <label id="error_name" class="error"></label>
                </div>

                <div class="col-md-12 form-group">
                  <label for="book_category_description" class="control-label col-form-label">Description</label>
                  <textarea id="book_category_description" class="form-control" rows="3" v-model="row.description"></textarea>
                  <label id="error_description" class="error"></label>
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
      $('ul#side-menu a.menu-book').addClass('active');
    },

    initialize() {
      var params = {keyword: this.keyword, page: this.page, per_page: this.per_page };
      return axios
        .get("/api/book_categories", { params: params })
        .then(response => {
           this.rows = response.data.data;
           this.total = response.data.total;
         })
        .catch(e => {
           console.log(e);
        });
    },

    searchBookCategory() {
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

    newBookCategory() {
      this.row = {
        book_category_id: '',
        name: '',
        description: ''
      };
      $("label.error").html('');
      this.openPopupForm('new');
    },

    editBookCategory(book_category_id) {
      return axios
        .get("/api/book_categories/" + book_category_id)
        .then(response => {
           this.row = response.data.data;
           $("label.error").html('');
           this.openPopupForm('edit');
         })
        .catch(e => {
           console.log(e);
        });
    },

    deleteBookCategory(book_category_id, name) {
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
            .delete("/api/book_categories/" + book_category_id, { headers: headers })
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
      if(this.row.book_category_id == '')
      {
        axios.post("/api/book_categories", { book_category: this.row }, { headers: headers })
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
        axios.put("/api/book_categories/" + this.row.book_category_id, { book_category: this.row }, { headers: headers })
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
        $('#popup-book-category-form .modal-title').html("Create Book Category");
        $('#popup-book-category-form .btn-success').html("<i class='fa fa-save'></i> Submit");
      }
      else
      {
        $('#popup-book-category-form .modal-title').html("Update Book Category");
         $('#popup-book-category-form .btn-success').html("<i class='fa fa-save'></i> Update");
      }
      $("#popup-book-category-form").modal();
    },

    closePopupForm: function() {
      $("#popup-book-category-form").modal('hide');
    }
  }
};
</script>