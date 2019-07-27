import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/Index'
import Login from '@/components/user/Login'
import middlewares from './middleware'
import auth from './middleware/auth'
import guest from './middleware/guest'
import store from "../store";

Vue.use(Router)
let routes = [
    {
      path: '/',
      name: 'index',
      component: Index,
      beforeEnter: auth
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
      beforeEnter: guest
    }
]


const router = new Router({
    routes,
    mode: 'history',
});

export default router;
