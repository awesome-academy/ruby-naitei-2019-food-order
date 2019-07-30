<template>
  <div id="web">
    <div class="content text-center">
      <h1 v-if="isLogin">Please login <span>{{loading_string}}</span></h1>
      <h1 v-else><button type="button" class="btn btn-2 custom-btn" @click="login"><i class="fa fa-google"></i> Login By Google </button></h1>
      <p>Web Order Foods</p>
      <div class="loader">
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'Login',
    data() {
      return {
        count_loading: 1,
        loading_string: '.',
        count_increase_loading: true,
        jwt_access: '',
        isLogin: false,
        errorLoginFbFail: '',
        isLoginFbFail: false,
        cross_get_success: false,
      }
    },

    computed: {
      loading_count: function() {
        return this.loadingAnimation()
      }
    },

    mounted() {

      let timeInterval = 600
      setInterval(() => {
        this.loadingAnimation()
      }, timeInterval)

    },

    methods: {
      loadingAnimation() {
        let loading =  this.count_loading
        if(this.count_loading === 0) {
          this.count_loading ++
          this.count_increase_loading = true
        }
        else if(this.count_loading === 3) {
          this.count_loading --
          this.count_increase_loading = false
        }
        else {
          this.count_loading += this.count_increase_loading ? 1 : -1
        }
        let str = '.'
        this.loading_string = str.repeat(loading)
      },

      login() {
        this.isLogin = true;
        this.cross_get_success = false;
        console.log(process.env.api_login_google);
        let ggLoginPopup = window.open('http://' + process.env.api_login_google, 'Google Auth', 'height=600,width=450');
        let self = this;
        let INTERVAL = 500;
        let LOGIN_TIME_LIMIT = 5 * 60 * 1000;
        let loginTime = 0;
        let timeLoginFails = 0;
        let loginInterval = setInterval(() => {
          loginTime += INTERVAL;
          if (ggLoginPopup.closed) {
            this.crossGet()
            let token = self.jwt_access
            if (token) {
              self.$store.dispatch('auth/saveToken', {token}).then(res => {
              }).catch((err) => {
                console.log(err);
                }
              );

              self.$store.dispatch('auth/fetchUser')
                .then(() => {
                  clearInterval(loginInterval);
                  self.loggingIn = false;
                  this.$notify({
                    group: 'foo',
                    type: 'success',
                    title: 'Welcome ' + this.$store.state.auth.user.first_name,
                    text: 'Let Order Your Food',
                    duration: 5000,
                    speed: 1000
                  });
                  self.$router.push({name: 'index'});
                })
                .catch(() => {
                  this.isLogin = false;
                  this.$notify({
                    group: 'foo',
                    type: 'error',
                    title: 'Login Failed',
                    text: 'Something error when login google with your google account. Please check it or re click Google Login Button',
                    duration: 5000,
                    speed: 1000
                  });
                  clearInterval(loginInterval);
                  self.loggingIn = false;
                });
            } else {
              if(this.cross_get_success) {
                this.isLogin = false;
                this.$notify({
                  group: 'foo',
                  type: 'error',
                  title: 'Login Failed',
                  text: 'Something error when login google with your google account. Please check it or re click Google Login Button',
                  duration: 5000,
                  speed: 1000
                });
                clearInterval(loginInterval);
              }
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
            this.$notify({
              group: 'foo',
              type: 'error',
              title: 'Login Failed',
              text: 'Over Time! Please re click login button',
              duration: 5000,
              speed: 1000
            });
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

      crossGet() {
        let CrossStorageClient = require('cross-storage').CrossStorageClient;
        let storage = new CrossStorageClient(process.env.api_host + '/cross')
        storage.onConnect().then(() => {
          return storage.get('jwt_access');
        }).then((res) => {
          this.jwt_access = res
          this.cross_get_success = true;
        }).catch((err) => {
          // Handle error
          console.log(err)
        });
      }
    }
  }
</script>
<style scoped="scss">
  #web {
    background: url(/static/images/bg-image.jpg);
    background-size: cover;
    width: 100%;
    height: 100vh;
    position: relative;
    opacity: 0.7;
  }
  .content {
    background: black;
    opacity: 0.8;
    width: 100%;
    position: absolute;
    top: 30%;
    padding: 2% 0 1% 0;
  }
  .content h1 {
    font-family: "Kaushan Script", cursive;
    color: aliceblue;
    font-size: calc(3em + 2vw);
    cursor: default;
  }
  .content p {
    font-family: Arial, Helvetica, sans-serif;
    color: #FBB448;
    font-size: calc(1rem + 1vw);
    cursor: default;
  }
  .loader {
    border: 14px solid #f3f3f3;
    border-radius: 50%;
    border-top: 14px solid #3498db;
    width: 100px;
    height: 100px;
    -webkit-animation: spin 2s linear infinite; /* Safari */
    animation: spin 2s linear infinite;
    margin-left: 46%;
  }

  /* Safari */
  @-webkit-keyframes spin {
    0% { -webkit-transform: rotate(0deg); }
    100% { -webkit-transform: rotate(360deg); }
  }

  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }

  .custom-btn {
    width: 250px;
    height: 100px;
    font-size: calc(1.1rem + 0.9vw);
    background-image: linear-gradient(to right, #fbf7c2 0%, #a6c1ee 51%, #c2fbe1 100%);
    color: #333 !important;
  }
</style>
