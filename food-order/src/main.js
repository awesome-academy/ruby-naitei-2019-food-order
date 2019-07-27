// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store/index'
import {sync} from 'vuex-router-sync'
import axios from 'axios'
import vClickOutside from 'v-click-outside'
import Notifications from 'vue-notification'

export default axios.create({
  baseURL: process.env.API_HOST,
  headers: {
    'Content-Type': 'application/json'
  }
})
console.log(process.env.api_host)
Vue.config.productionTip = false
// require('bootstrap/dist/css/bootstrap.min.css')
Vue.use(router)
Vue.use(vClickOutside)
Vue.use(Notifications)

sync(store, router);

Vue.prototype.getCookie = (name) => {
  let nameEQ = name + "=";
  let ca = document.cookie.split(';');
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) === ' ') c = c.substring(1, c.length);
    if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
  }
  return null;
}

Vue.prototype.loading = true

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>',
})
