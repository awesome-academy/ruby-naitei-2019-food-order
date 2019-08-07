<template>
    <div>
        <div class="gtco-loader" v-show="loading"></div>
        <div id="page">
            <left-bar/>
            <main-content @toggleLoading="toggleLoading"/>
        </div>
        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
        </div>
    </div>
</template>
<script>
    import LeftBar from './home/LeftBar'
    import MainContent from './home/MainContent'
    export default {
        name: 'Index',
        components: {
            LeftBar: LeftBar,
            MainContent: MainContent
        },
      data() {
          return {
            loading: true
          }
      },

      mounted() {

      },

      created() {
          this.loading = false;
      },

      methods: {
        toggleLoading() {
          this.loading = !this.loading
        }
      }
    }
</script>
