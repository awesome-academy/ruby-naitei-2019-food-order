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
    token: getCookie('token') ? getCookie('token') : null
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
            commit(types.FETCH_USER_SUCCESS, {user: data});
            resolve();
          })
          .catch(() => {
            commit(types.FETCH_USER_FAILURE);
            reject();
          });
      });

    },

    login({commit, state}) {
      console.log(process.env.api_login_google);
      let ggLoginPopup = window.open('http://' + process.env.api_login_google, 'Google Auth', 'height=600,width=450');
      let self = this;
      let INTERVAL = 500;
      let LOGIN_TIME_LIMIT = 5 * 60 * 1000;
      let loginTime = 0;
      let timeLoginFails = 0;
      let loginInterval = setInterval(function () {
        loginTime += INTERVAL;
        if (ggLoginPopup.closed) {
          let token = getCookie('token');
          if (token) {
            self.dispatch('auth/saveToken', {token}).then();

            self.dispatch('auth/fetchUser')
              .then(() => {
                clearInterval(loginInterval);
                self.loggingIn = false;
                self.$router.push({name: 'Index'});
              })
              .catch(() => {
                clearInterval(loginInterval);
                self.loggingIn = false;
              });
          } else {
            if(!self.isLoginFbFail) {
              timeLoginFails = loginTime;
            }
            self.isLoginFbFail = true;
            self.errorLoginFbFail = 'Có vấn đề khi đăng nhập bằng tài khoản Google của bạn. ' +
              'Vui lòng liên hệ quản trị viên để biết thêm chi tiết';
            self.loggingIn = false;
          }
        }
        if (timeLoginFails > 0 && (loginTime - timeLoginFails) > 3000 && self.isLoginFbFail) {
          self.isLoginFbFail = false;
          clearInterval(loginInterval);
          self.loggingIn = false;
        }
        if (loginTime > LOGIN_TIME_LIMIT) {
          clearInterval(loginInterval);
          self.timeout = true;
          self.loggingIn = false;
          self.isLoginFbFail = false
        }
      }, INTERVAL);
    },

    logout({commit, state}) {
      return new Promise((resolve, reject) => {
        post(process.env.API_HOST + `/api/auth/logout`)
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
