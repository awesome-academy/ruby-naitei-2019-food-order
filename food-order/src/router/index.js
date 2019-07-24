import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/Index'
import Login from '@/components/user/Login'
import middlewares from './middleware'

Vue.use(Router)
export default new Router({
  routes: [
    {
      path: '',
      beforeEnter: middlewares.auth(),
      children: [
        {
          path: '/',
          name: 'Index',
          component: Index
        }
      ]
    },
  ]
})
