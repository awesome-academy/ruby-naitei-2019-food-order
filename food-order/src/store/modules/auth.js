import {get, post} from '../../helper/request'

const types = {
  LOGOUT: 'LOGOUT',
  SAVE_TOKEN: 'SAVE_TOKEN',
  FETCH_USER: 'FETCH_USER',
  FETCH_USER_SUCCESS: 'FETCH_USER_SUCCESS',
  FETCH_USER_FAILURE: 'FETCH_USER_FAILURE'
};

const emptyUser = {
  id: null,
  avatar: null,
  birthday: null,
  email: null,
  name: null,
};

function getCookie(name) {
  let nameEQ = name + "=";
  let ca = document.cookie.split(';');
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) === ' ') c = c.substring(1, c.length);
    if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
  }
  return null;
}

const auth = {
  state: {
    user: emptyUser,
    token:  window.localStorage.getItem('token') ?  window.localStorage.getItem('token') : null
  },
  mutations: {
    [types.SAVE_TOKEN](state, {token}) {
      state.token = token;
      window.localStorage.setItem('token', token);
    },
    [types.FETCH_USER_SUCCESS](state, {user}) {
      state.user = user;
    },
    [types.FETCH_USER_FAILURE](state) {
      state.token = null;
    },
    [types.LOGOUT](state) {
      state.user = emptyUser;
      state.token = null;
      window.localStorage.removeItem('token');
    }
  },
  actions: {
    saveToken({commit}, {token}) {
      commit(types.SAVE_TOKEN, {token});
    },

    fetchUser({commit, state}) {
      return new Promise((resolve, reject) => {
        get(process.env.api_host + `/auth/check`)
          .then(({data}) => {
            console.log(data)
            commit(types.FETCH_USER_SUCCESS, {user: data.current_user});
            resolve();
          })
          .catch((err) => {
            console.log(err)
            commit(types.FETCH_USER_FAILURE);
            reject();
          });
      });

    },

    logout({commit, state}) {
      return new Promise((resolve, reject) => {
        post(process.env.api_host + `/auth/logout`)
          .then(() => {
            commit(types.LOGOUT);
            resolve();
          })
          .catch(() => {
            reject();
          })
      });
    }
  },
  namespaced: true,
};

export default auth;
