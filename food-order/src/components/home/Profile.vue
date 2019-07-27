<template>
  <div class="row mx-auto">
    <div class="avatar-wrapper">
      <img class="profile-pic" :src="avatar_link"/>
      <div class="upload-button">
        <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
      </div>
      <input class="file-upload" type="file" accept="image/*"/>
    </div>
    <form action="#" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">
      <div class="row form-group">
        <div class="col-md-12">
          <label class="sr-only" for="firstname">First Name</label>
          <input type="text" id="firstname" class="form-control" :placeholder="current_user.first_name">
        </div>
      </div>
      <div class="row form-group">
        <div class="col-md-12">
          <label class="sr-only" for="lastname">Last Name</label>
          <input type="text" id="lastname" class="form-control" :placeholder="current_user.last_name">
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
        <button type="button" class="btn btn-2"><span class="glyphicon glyphicon-heart"></span>UPLOAD</button>
      </div>

    </form>
  </div>
</template>
<script>
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
    }
  }
</script>
