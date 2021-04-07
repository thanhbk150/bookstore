<template>
  <div id="app" class="container-fluid">

    <!-- Breadcrumb -->
    <div class="row bg-title">
      <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
          <h4 class="page-title">Books</h4>
      </div>
      <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="/#/">Dashboard</a></li>
            <li class="active">Books</li>
        </ol>
      </div>
    </div>

    <!-- Listing -->
    <div class="row">
      <div class="col-md-12">
        <div class="white-box">
          <!-- Search -->
          <div class="row">
            <div class="col-md-3">
                <Select2 v-model="category_id" :options="categories" />
            </div>
            <div class="col-md-4">
              <div class="input-group">
                <input type="text" class="form-control" v-model="keyword" placeholder="Search by Title or Author's Name">
                <span class="input-group-btn">
                  <button type="button" class="btn waves-effect waves-light btn-info" v-on:click="searchBook()" style="height:38px;"><i class="fa fa-search"></i></button>
                </span>
              </div>
            </div>
            <div class="col-md-2" style="padding-top:8px;" v-show="keyword != '' || category_id != ''">
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
                              <th>TITLE</th>
                              <th>CATEGORY</th>
                              <th>AUTHOR</th>
                              <th>EDITION NUMBER</th>
                              <th>PRICE</th>
                              <th>PUBLISHER</th>
                              <th>
                                <button type="button" class="btn btn-success btn-circle btn-sm" v-on:click="newBook()">
                                <i class="ti-plus"></i></button>
                              </th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr v-for="row in rows" :key="row.book_id">
                              <td class="text-center">{{row.book_id}}</td>
                              <td>{{row.title}}</td>
                              <td>{{row.category_name}}</td>
                              <td>{{row.author_name}}</td>
                              <td>{{row.edition_number}}</td>
                              <td>{{row.price}}</td>
                              <td>{{row.publisher_name}}</td>
                              <td>
                                <a :href="'/#/books/'+row.book_id" class="btn btn-info btn-circle btn-sm"><i class="ti-info"></i></a>
                                <button type="button" class="btn btn-warning btn-circle btn-sm" v-on:click="editBook(row.book_id)"><i class="ti-pencil-alt"></i></button>
                                <button type="button" class="btn btn-danger btn-circle btn-sm" v-on:click="deleteBook(row.book_id, row.title)"><i class="ti-trash"></i></button>
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
    <div id="popup-book-form" class="modal fade" style="display: none;">
      <div class="modal-dialog modal-lg">
       <div class="modal-content">
          <div class="modal-header">
             <h4 class="modal-title">Add Book</h4>
          </div>
          <div class="modal-body">
             <div class="row">
                <div class="col-md-12 form-group">
                  <div class="row">  
                    <div class="col-md-6">
                      <label for="book_author_id" class="control-label col-form-label">Author</label>
                      <Select2 v-model="row.author_id" :options="authors" />
                      <label id="error_author_id" class="error"></label>
                    </div>

                    <div class="col-md-6">
                      <label for="book_category_id" class="control-label col-form-label">Category</label>
                      <Select2 v-model="row.book_category_id" :options="categories" />
                      <label id="error_book_category_id" class="error"></label>
                    </div>
                  </div>
                </div>


                <div class="col-md-12 form-group">
                  <label for="book_title" class="control-label col-form-label">Title *</label>
                  <input type="text" id="book_title" class="form-control" v-model="row.title">
                  <label id="error_title" class="error"></label>
                </div>

                <div class="col-md-12 form-group">
                  <label for="book_description" class="control-label col-form-label">Description</label>
                  <textarea id="book_description" class="form-control" rows="3" v-model="row.description"></textarea>
                  <label id="error_description" class="error"></label>
                </div>
                <div class="col-md-12 form-group">
                  <div class="row">  
                    <div class="col-md-4">
                      <label for="book_edition_number" class="control-label col-form-label">Edition Number</label>
                      <input type="text" id="book_edition_number" class="form-control" v-model="row.edition_number">
                      <label id="error_edition_number" class="error"></label>
                    </div>

                    <div class="col-md-8">
                      <label for="book_copyright" class="control-label col-form-label">Copyright</label>
                      <input type="text" id="book_copyright" class="form-control" v-model="row.copyright">
                      <label id="error_copyright" class="error"></label>
                    </div>
                  </div>
                </div>

                <div class="col-md-12 form-group">
                  <div class="row">    
                    <div class="col-md-4">
                      <label for="book_price" class="control-label col-form-label">Price</label>
                      <input type="text" id="book_price" class="form-control" v-model="row.price">
                      <label id="error_price" class="error"></label>
                    </div>

                    <div class="col-md-4">
                      <label for="book_quantity" class="control-label col-form-label">Quantity</label>
                      <input type="text" id="book_quantity" class="form-control" v-model="row.quantity">
                      <label id="error_quantity" class="error"></label>
                    </div>
                  </div>
                </div>

                <div class="col-md-12 form-group">
                  <label for="book_publisher_id" class="control-label col-form-label">Publisher</label>
                  <Select2 v-model="row.publisher_id" :options="publishers" />
                  <label id="error_publisher_id" class="error"></label>
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
    category_id: '',
    keyword: '',
    page: 1,
    per_page: 10,
    rows: [],
    total: 0,
    row: {},
    authors: [],
    publishers: [],
    categories: []
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
    this.getAuthors();
    this.getCategories();
    this.getPublishers();
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
      var params = {category_id: this.category_id, keyword: this.keyword, page: this.page, per_page: this.per_page };
      return axios
        .get("/api/books", { params: params })
        .then(response => {
           this.rows = response.data.data;
           this.total = response.data.total;
         })
        .catch(e => {
           console.log(e);
        });
    },

    getAuthors() {
      return axios
        .get("/api/authors/select2")
        .then(response => {
           this.authors = response.data;
         })
        .catch(e => {
           console.log(e);
        });
    },

    getCategories() {
      return axios
        .get("/api/book_categories/select2")
        .then(response => {
           this.categories = response.data;
         })
        .catch(e => {
           console.log(e);
        });
    },

    getPublishers() {
      return axios
        .get("/api/publishers/select2")
        .then(response => {
           this.publishers = response.data;
         })
        .catch(e => {
           console.log(e);
        });
    },

    searchBook() {
      this.page = 1;
      this.initialize();
    },

    resetSearch() {
      this.keyword = '';
      this.category_id = '';
      this.page = 1;
      this.initialize();
    },

    setPage(n) {
      this.page = n;
      $('html,body').animate({scrollTop:150}, 500);
    },

    newBook() {
      this.row = {
        book_id: '',
        author_id: '',
        publisher_id: '',
        title: '',
        edition_number: '',
        copyright: '',
        description: '',
        price: ''
      };
      $("label.error").html('');
      this.openPopupForm('new');
    },

    editBook(book_id) {
      return axios
        .get("/api/books/" + book_id)
        .then(response => {
           this.row = response.data.data;
           $("label.error").html('');
           this.openPopupForm('edit');
         })
        .catch(e => {
           console.log(e);
        });
    },

    deleteBook(book_id, name) {
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
            .delete("/api/books/" + book_id, { headers: headers })
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
      if(this.row.book_id == '')
      {
        axios.post("/api/books", { book: this.row }, { headers: headers })
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
        axios.put("/api/books/" + this.row.book_id, { book: this.row }, { headers: headers })
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
        $('#popup-book-form .modal-title').html("Create Book");
        $('#popup-book-form .btn-success').html("<i class='fa fa-save'></i> Submit");
      }
      else
      {
        $('#popup-book-form .modal-title').html("Update Book");
         $('#popup-book-form .btn-success').html("<i class='fa fa-save'></i> Update");
      }
      $("#popup-book-form").modal();
    },

    closePopupForm: function() {
      $("#popup-book-form").modal('hide');
    }
  }
};
</script>