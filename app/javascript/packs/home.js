
//import Vue from 'vue'
import Vue from 'vue/dist/vue.js'
import VueRouter from 'vue-router';
import VueMeta from 'vue-meta'
import Select2 from 'v-select2-component';
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

import Root from '../components/layout';
import Home from '../components/dashboard'
import Users from '../components/user'
import UserShow from '../components/user/show'
import Authors from '../components/author'
import AuthorShow from '../components/author/show'
import Books from '../components/book'
import BooksShow from '../components/book/show'
import BookCategories from '../components/bookcategory'
import BookCategoriesShow from '../components/bookcategory/show'
import Publishers from '../components/publisher'
import PublisherShow from '../components/publisher/show'



Vue.use(VueRouter)
const router = new VueRouter({
  routes: [
    { path: "/", component: Home },
    { path: "/users", component: Users },
    { path: "/users/:id", component: UserShow },
    { path: "/authors", component: Authors },
    { path: "/authors/:id", component: AuthorShow },
    { path: "/books", component: Books },
    { path: "/books/:id", component: BooksShow },
    { path: "/book_categories", component: BookCategories },
    { path: "/book_categories/:id", component: BookCategoriesShow },
    { path: "/publishers", component: Publishers },
    { path: "/publishers/:id", component: PublisherShow },
  ],
});

Vue.use(VueMeta)
Vue.component('Select2', Select2);
Vue.use(VueSweetalert2);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Root),
    router,
  }).$mount()
  document.body.appendChild(app.$el)
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
