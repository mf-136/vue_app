import Vue from 'vue'
import Router from 'vue-router'

import Index from '../components/indexPage.vue'
import Header from '../components/header.vue'
import Footer from '../components/footer.vue'
import List from '../components/listPage.vue'
import About from '../components/aboutPage.vue'
import Contact from '../components/contactPage.vue'
import ShowPage from '../components/showPage.vue'
import NewPage from '../components/newPage.vue'
import EditPage from '../components/editPage.vue'
import MicropostPage from '../components/micropostPage.vue'



Vue.use(Router)

export default new Router({
  // mode: 'history',
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
      path: '/users/new',
      name: 'newPage',
      components: {
        default: NewPage,
        header: Header,
        footer: Footer
      }
    },
    { 
      path: '/users/:id(\\d+)',
      name: 'showPage', 
      components: {
        default: ShowPage,
        header: Header,
        footer: Footer
      },
    },
    { 
      path: '/users/:id(\\d+)/edit',
      name: 'editPage', 
      components: {
        default: EditPage,
        header: Header,
        footer: Footer
      },
    },
    {
      path: '/users/list',
      name: 'list',
      components: {
        default: List,
        header: Header,
        footer: Footer
      }
    },
    {
      path: '/microposts',
      name: 'microposts',
      components: {
        default: MicropostPage,
        header: Header,
        footer: Footer
      }
    },
    {
      path: '/about',
      name: 'about',
      components: {
        default: About,
        header: Header,
        footer: Footer
      }
    },
    {
      path: '/contact',
      name: 'contact',
      components: {
        default: Contact,
        header: Header,
        footer: Footer
      }
    }
  ]
})
