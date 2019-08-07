<template>
  <div id="app">
    <notifications group="foo"/>
    <router-view/>
  </div>
</template>

<script>
  import {interceptors} from "./helper/request.js";
  export default {
    name: 'App',

    created() {
      var width = $(window).width();

      interceptors((err) => {
        console.log("err.responese: ", err.response);
        if (err.response.status === 401) {
          this.$notify({
            group: 'foo',
            type: 'error',
            title: 'Not Authenticated',
            text: 'Not Authenticated!!, Please reload this page!',
            duration: 5000,
            speed: 1000
          });
        }
      });
    }
  }
</script>
