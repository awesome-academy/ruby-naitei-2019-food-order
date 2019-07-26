import store from '../../store/index'

export default function (to, from, next) {
    if (!store.state.auth.token) {
        next();
    }
    else {
        if(!store.state.auth.user.id){
            store.dispatch('auth/fetchUser')
                .then(() => {
                    next({name: 'Index'});
                })
                .catch(() => {
                    next()
                });
        } else {
            next({name: 'Index'});
        }
    }
};
