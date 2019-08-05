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
let order = () => {
  let orders = store.state.orderList.filter((o) => o.user_id === store.state.auth.user.id)
  if(orders.length) {
    return orders[0]
  }
  return []
}
Vue.prototype.current_user_orders = order()

  Vue.prototype.handleAvatar = (avatar_link) => {
  let tmp = "public/assets"
  let result = avatar_link
  if(avatar_link.includes(tmp)) {
    result = avatar_link.replace(tmp, process.env.api_host + '/assets')
  }
  return result
}
Vue.prototype.formatCurrency = (amount, decimalCount = 0, decimal = ".", thousands = ",") => {
  try {
    decimalCount = Math.abs(decimalCount);
    decimalCount = isNaN(decimalCount) ? 2 : decimalCount;

    const negativeSign = amount < 0 ? "-" : "";

    let i = parseInt(amount = Math.abs(Number(amount) || 0).toFixed(decimalCount)).toString();
    let j = (i.length > 3) ? i.length % 3 : 0;

    return negativeSign + (j ? i.substr(0, j) + thousands : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands) + (decimalCount ? decimal + Math.abs(amount - i).toFixed(decimalCount).slice(2) : "");
  } catch (e) {
    console.log(e)
  }
};
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>',
})
