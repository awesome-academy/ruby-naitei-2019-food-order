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
