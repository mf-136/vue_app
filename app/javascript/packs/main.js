import Vue from 'vue'
import App from './app.vue'
import router from '../router/router.js'
// import store from '../store/store.js'
import '../plugins/element.js'
// import axios from 'axios'
// import VueAxiosPlugin from '../filter/token_csrf.js'

// Vue.use(VueAxiosPlugin, { axios: axios }) 

Vue.config.productionTip = false

// $httpプロパティ追加
Vue.prototype.$http = (url, opts) => fetch(url, opts)

Vue.mixin({
  created: function() {
    let { title, keyword, description } = this.$data;
    let base_title = "Ruby on Rails Tutorial Sample App";
    if (title) { 
      document.title = `${title} | ${base_title}`; 
    } else {
      document.title = base_title;
    }
    if (keyword) {
      document.querySelector("meta[name='keyword']").
        setAttribute('content', keyword);
    }
    if (description) {
      document.querySelector("meta[name='description']").
        setAttribute('content', description);
    }
  }
});

// new Vue({
//   router, // this.$routerで参照可能になる
//   // store,  // this.$storeで参照可能になる
//   render: h => h(App)
// }).$mount('#app')

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App)
  }).$mount('#app')
  document.body.appendChild(app.$el)

  console.log(app)
})






/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.


// ADD:
// import Vue from 'vue'
// import App from 'app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })

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
