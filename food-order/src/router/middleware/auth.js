import store from '../../store'

export default (to, from, next) => {
  console.log('test middleware auth')
  let dispatchToLogin = () => {
    next({name: 'login'})
  }
  console.log('store.state.auth.token: ',store.state.auth.token)
  if (!store.state.auth.token) {
    console.log(1)
    dispatchToLogin()
  } else {

    store.dispatch('auth/fetchUser')
      .then(() => {
        console.log('test0000')
        if (to.path !== '/') {
          next({name: 'index'});
        } else {
          next();
        }
      })
      .catch((err) => {
        console.log('err')
        console.log(2)
        dispatchToLogin()
      });
  }
}
