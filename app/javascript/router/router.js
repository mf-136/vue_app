import Vue from 'vue'
import Router from 'vue-router'

import Index from '../components/indexPage.vue'
import Header from '../components/header.vue'
import Footer from '../components/footer.vue'
import Help from '../components/help.vue'
import About from '../components/about.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  // base: process.env.BASE_URL,
  routes: [
    { path: '*', redirect: '/' },
    {
      path: '/',
      name: 'index',
      components: {
        default: Index,
        header: Header,
        footer: Footer
      }
    },
    {
      path: '/help',
      name: 'help',
      component: Help
    },
    {
      path: '/about',
      name: 'about',
      component: About
    }
  ]
})
