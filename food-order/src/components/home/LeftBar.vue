<template>
    <div>
        <!-- <div class="page-inner"> -->
      <nav class="gtco-nav" role="navigation">
        <div class="gtco-container">

          <div class="row">
            <div class="col-sm-5 col-xs-12">
              <div id="gtco-logo">Yasuo</div>
            </div>
            <div class="col-xs-7 text-right menu-1">
              <ul>
                <li class="active"><img class="img-circle" style="width: calc(0.8em + 1vw); height: calc(0.8em + 1vw)" :src="current_user.avatar" alt=""></li>
                <li class="active has-dropdown">
                  <span class="cursor-pointer" @click="showOptions" v-click-outside="closeOptions">{{current_user.last_name}}</span>
                  <ul class="dropdown">
                    <li class="cursor-pointer" @click="showUserProfile">Edit Profile</li>
                    <li class="cursor-pointer" @click="featureNotRelease">View History</li>
                    <li class="cursor-pointer" @click="logout">Log Out</li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>

        </div>
      </nav>

      <header id="gtco-header" class="gtco-cover" role="banner" style="background-image: linear-gradient(to right bottom, rgb(25, 125, 165), rgb(0, 0, 0)), linear-gradient(transparent, rgb(0, 0, 0) 100%)" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="gtco-container">
          <div class="row">
            <div class="col-md-12 col-md-offset-0 text-center">
              <div class="row">
                <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                  <label class="cursive-font">Pick your foods!</label>
                </div>
              </div>
              <profile v-if="show_profile"/>
              <order-list v-else/>
            </div>
          </div>

        </div>
      </header>
    </div>
</template>
<script>
  import Profile from './Profile.vue'
  import OrderList from './OrderList.vue'
  export default {
    name: 'leftBar',
    components: {
      Profile: Profile,
      OrderList: OrderList
    },
    data() {
      return {
        show_profile: false,
        current_user: this.$store.state.auth.user
      }
    },
    mounted() {
    },
    methods: {
      showUserProfile() {
        this.show_profile = true
      },

      showOptions() {
        $('.dropdown').css('display', 'block')
          .addClass('animated-fast fadeInUpMenu');
      },

      closeOptions() {
        $('.dropdown').css('display', 'none')
          .removeClass('animated-fast fadeInUpMenu');
      },

      featureNotRelease() {
        this.$notify({
          group: 'foo',
          type: 'warn',
          title: 'Feature Not Release',
          text: 'Sorry for inconvenience, this feature is not release!!',
          duration: 5000,
          speed: 1000
        });
      },

      logout() {
        this.loading = true
        this.$store.dispatch('auth/logout')
          .then(() => {
            setTimeout(() => {
              this.loading = false
              this.$router.push({name: 'login'});
            }, 1000)

        });
      }
    }
  }
</script>
<style>
  .cursor-pointer:hover {
    color: #FBB448
  }
</style>
