import Vue from 'vue'
import Vuex from 'vuex'
import auth from './modules/auth.js'

Vue.use(Vuex);

const store = new Vuex.Store({
    modules : {
        auth,
    },
    state: {
        isLogin: false,
        accessKey: null,
        user: null,
        orderList: window.localStorage.getItem('orderList') ? JSON.parse(window.localStorage.getItem('orderList')) : [],
        gtc_loading: true,
    },

    getters: {},
    mutations: {
        resetData(state) {
            state.isLogin = false;
            state.accessKey = null;
            state.user = null;
        },
    },
    actions: {},
});

export default store;
