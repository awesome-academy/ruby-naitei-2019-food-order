import store from '../../store/index'

export default function (to, from, next) {
    if (!store.state.auth.token) {
      dispatchToLogin()
    }
    else {
        store.dispatch('auth/fetchUser')
            .then(() => {
                next();
            })
            .catch(() => {
              dispatchToLogin()
            });
    }

    function dispatchToLogin() {
      store.dispatch('auth/login')
        .then(() => {

        })
        .catch(() => {
          alert('Unable request to Server!!')
        })
    }
};
