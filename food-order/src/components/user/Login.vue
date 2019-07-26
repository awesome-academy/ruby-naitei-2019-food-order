<template>

</template>
<script>
  export default {
    name: 'Login',
    data() {
      return {

      }
    },

    mounted() {
      this.login()
    },

    methods: {
      login() {
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
              self.$store.dispatch('auth/saveToken', {token}).then();

              self.$store.dispatch('auth/fetchUser')
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
    }
  }
</script>
