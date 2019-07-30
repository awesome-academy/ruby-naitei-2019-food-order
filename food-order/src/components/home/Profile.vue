<template>
  <div class="row mx-auto">
    <div class="avatar-wrapper">
      <img class="profile-pic" :src="handleAvatar(avatar_link)"/>
      <div class="upload-button">
        <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
      </div>
      <input class="file-upload" type="file" accept="image/*" id="upload_avatar" @change="uploadAvatar"/>
    </div>
    <form action="#" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">
      <div class="row form-group">
        <div class="col-md-12">
          <label class="sr-only" for="firstname">First Name</label>
          <input type="text" id="firstname" class="form-control" :placeholder="current_user.first_name" v-model="first_name">
        </div>
      </div>
      <div class="row form-group">
        <div class="col-md-12">
          <label class="sr-only" for="lastname">Last Name</label>
          <input type="text" id="lastname" class="form-control" :placeholder="current_user.last_name" v-model="last_name">
        </div>
      </div>
      <div class="row form-group">
        <div class="col-md-12">
          <div class="gtco-contact-info text-left">
            <ul>
              <li class="address">Lab Education <br> 434 Trần Khát Chân, Hà Nội</li>
              <li class="email">{{current_user.email}}</li>
            </ul>
          </div>

        </div>
      </div>
      <div class="form-group">
        <button type="button" class="btn btn-1" @click="updateProfile"><span class="glyphicon glyphicon-heart margin-right-5"></span>UPDATE</button>
        <button type="button" class="btn btn-2" @click="back"><span class="glyphicon glyphicon-arrow-left margin-right-5" ></span>BACK</button>
      </div>

    </form>
  </div>
</template>
<script>
  import {put, post} from '../../helper/request'
  export default {
    name: 'profile',
    data() {
      return {
        current_user: this.$store.state.auth.user,
        first_name: '',
        last_name: '',
        avatar_link: ''
      }
    },
    mounted() {

      $(document).ready(function() {
        var readURL = function(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
              $('.profile-pic').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
          }
        }

        $(".file-upload").on('change', function(){
          readURL(this);
        });

        $(".upload-button").on('click', function() {
          $(".file-upload").click();
        });
      });
      this.first_name = this.current_user.first_name
      this.last_name = this.current_user.last_name
      this.avatar_link = this.current_user.avatar

    },

    methods: {
      notifyUploadSuccess() {
        this.$notify({
          group: 'foo',
          type: 'success',
          title: 'Update User Success',
          text: 'Update User Information Success! Congrats!!',
          duration: 5000,
          speed: 1000
        });
      },

      notifyUploadFailed() {
        this.$notify({
          group: 'foo',
          type: 'error',
          title: 'Update User Failed',
          text: 'Update User Information Failed! Please check it or contact Admin!!',
          duration: 5000,
          speed: 1000
        });
      },

      uploadAvatar(e) {
        let file = e.target.files[0]
        let formData = new FormData();
        formData.append('avatar', file)
        let url = process.env.api_host + '/upload-avatar'
        post(url, formData)
          .then((res) => {
            console.log(res)
            this.current_user = res.data.user
            this.$emit('changeUser', res.data.user)
            this.notifyUploadSuccess()
          })
          .catch(err => {
            this.notifyUploadFailed()
          })
      },

      updateProfile() {
        let url = process.env.api_host + '/user/update'
        let formData = new FormData();
        formData.append('first_name', this.first_name)
        formData.append('last_name', this.last_name)
        put(url, formData)
          .then(res => {
            this.$emit('changeUser', res.data.user)
            this.notifyUploadSuccess()
          })
          .catch((err) => {
            console.log(err)
            this.notifyUploadFailed()
          })
      },

      back() {
        this.$emit('back')
      }
    }
  }
</script>
<style>
  .margin-right-5 {
    margin-right: 5px;
  }
</style>
