<template>
  <div class="modal fade product_view" id="product_view">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <a href="#" id="close-popup" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>

        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6 product_img">
              <div class="col-md-12">
                <div class="thumbnail-1 thumbnail">
                  <div :id="`myCarousel-` + product.id" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <li :data-target="`#myCarousel-` + product.id" :data-slide-to="index" v-for="(img, index) in product.images" :class="(index === 0) ? 'active' : ''"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="item content-1" v-for="(img, index) in product.images" :class="(index === 0) ? 'active' : ''">
                        <img :src="host + img.image_link" :alt="img.image_link" class="img-responsive img-cus" style="width:100%">
                      </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" :href="`#myCarousel-` + product.id" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" :href="`#myCarousel-` + product.id" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                  <div class="caption">
                    <h4><a href="#">{{product.name}}</a></h4>
                    <h4>${{formatCurrency(product.default_price)}}</h4>
                    <p class="naiyo">{{product.description}}</p>
                  </div>
                  <div class="row">
                    <div class="ratings col-md-7">
                      <p class="hoshi">
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        (15 reviews)
                      </p>
                    </div>
                    <div class="qty col-md-5">
                      <span class="minus bg-dark" @click="$emit('decreaseNumber', product, -1)" :disabled="!product.number">-</span>
                      <input type="number" class="count" name="qty" :value="product.number" min="0">
                      <span class="plus bg-primary" @click="$emit('increaseNumber', product, 1)">+</span>
                    </div>
                  </div>
                  <div class="space-ten"></div>
                  <div class="btn-ground text-center">
                    <button type="button" class="btn btn-2" @click="orderFood(product)" :disabled="$store.state.finished_order"><i class="fa fa-shopping-cart"></i> Order Food</button>
                    <button type="button" class="btn btn-3" @click="addFavourite(product)" v-show="isShowFavourite"><i class="fa fa-heart"></i> Add to Favorite!</button>
                    <button type="button" class="btn btn-1" @click="removeFavourite(product)" v-show="!isShowFavourite"><i class="fa fa-trash"></i> Remove from Favorite!</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="container col-md-6">
              <div class="row" style="height: 660px; overflow-y: scroll">
                <div class="col-sm-12 padding-left-0" id="logout">
                  <div class="page-header">
                  </div>
                  <div class="comment-tabs">
                    <div class="tab-content tab-content-1">
                      <div v-if="comment_list.length < 1">
                        <h4>No Comments Yet!! Become a first person review for this!!</h4>
                      </div>
                      <div class="tab-pane active" v-for="(c, index) in comment_list" :key="`comment` + index">
                        <ul class="media-list">
                          <li class="media">
                            <a class="pull-left" href="#">
                              <img class="media-object img-circle" :src="handleAvatar(c.user_avatar)" :alt="c.user_name">
                            </a>
                            <div class="media-body">
                              <div class="well well-lg" :style="((editing_comment === c) && isEditing) ? 'border: solid 2px #FBB448': ''">
                                <div>
                                  <h4 class="media-heading text-uppercase reviews d-inline-block">{{c.user_name}} </h4>
                                  <span class="d-inline-block text-13">{{c.comment.created_at}}</span>
                                  <span class="margin-right-15 float-right cursor-pointer" @click="removeComment(c)" v-show="current_user.id === c.comment.user_id"><i class="fa fa-trash d-inline-block"></i></span>
                                  <span class="margin-right-15 float-right cursor-pointer" @click="editComment(c)" v-show="current_user.id === c.comment.user_id"><i class="fa fa-edit"></i></span>
                                </div>

                                <p class="media-comment" v-html="c.comment.comment">
                                </p>
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row margin-top-20">
                <div class="">
                  <a class="pull-left" href="#">
                    <img class="media-object img-circle avatar" :src="handleAvatar(current_user.avatar)" alt="profile">
                  </a>
                </div>

                <text-area-emoji-picker v-model="text"/>
                <i class="fa fa-reply" @click="actionComment"></i>
              </div>
              <div>
                <p class="text-info cursor-pointer" v-if="isEditing" @click="resetEdit">Click to cancel Edit</p>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import {post, del, get, put} from '../../helper/request'
  import TextAreaEmojiPicker from '../utils/TextAreaEmojiPicker.vue'
  export default {
    name: 'ItemDetail',
    props: ["product", "favourite_list"],
    data() {
      return {
        current_user: this.$store.state.auth.user,
        host: process.env.api_host,
        isShowFavourite: true,
        text: '',
        comment_list: [],
        isEditing: false,
        editing_comment: {}
      }
    },

    components: {
      TextAreaEmojiPicker
    },

    computed : {
    },
    watch: {
      "product" : function() {
        if(this.product) {
          this.getListComments()
        }
        if(this.favourite_list.filter((f) => f.food_id == this.product.id).length) {
          this.isShowFavourite = false
        }
        else {
          this.isShowFavourite = true
        }
      }
    },
    mounted() {
      if(this.favourite_list.filter((f) => f.food_id == this.product.id).length) {
        this.isShowFavourite = false
      }

    },
    methods: {
      getListComments() {
        let url = this.host + '/comment/index?food_id=' + this.product.id
        get(url)
          .then(res => {
            this.comment_list = res.data.comments ? res.data.comments : []
          })
          .catch(err => {

          })
      },

      editComment(c) {
        let comment = c.comment
        this.isEditing = true
        this.editing_comment = c
        this.text = comment.comment
        $('#textarea').focus()
      },

      resetEdit() {
        this.isEditing = false
        this.text = ''
      },

      removeComment(c) {
        let r = confirm("Are you sure remove this comment!");
        if(r  == false) {
          return
        }
        let comment = c.comment
        let url = this.host + '/comment/destroy'
        let payload = {
          comment_id: comment.id
        }
        post(url, payload)
          .then(res => {
            let index = this.comment_list.indexOf(c)
            if(index > -1) {
              this.comment_list.splice(index, 1)
            }
            this.$notify({
              group: 'foo',
              type: 'success',
              title: 'Remove Comment Successfully',
              text: 'Remove Comment Successfully! Let it be!',
              duration: 5000,
              speed: 1000
            });
          })
          .catch(err => {

          })
      },

      orderFood(product) {
        this.$emit('order', product)
        $('#close-popup').click()
      },

      addFavourite(product) {
        let url = this.host + '/add-favourite'
        let payload = {
          food_id: product.id
        }
        post(url, payload)
          .then((res) => {
            this.isShowFavourite = false
            let length = this.favourite_list.filter(f => f.id === product.id).length
            if(length < 1) {
              this.$emit('pushFavourite', product)
              this.$notify({
                group: 'foo',
                type: 'success',
                title: 'Add Favourite Successfully',
                text: 'Add Favourite Successfully! Let it be!',
                duration: 5000,
                speed: 1000
              });
            }
          })
          .catch((err) => {

          })
      },

      removeFavourite(product) {
        let url = this.host + '/remove-favourite'
        let payload = {
          food_id: product.id
        }
        post(url, payload)
          .then((res) => {
            this.isShowFavourite = true
            let index = this.favourite_list.indexOf(product)
            if (index > -1) {
              this.$emit('removeFavourite', index)
              this.$notify({
                group: 'foo',
                type: 'success',
                title: 'Remove Favourite Successfully',
                text: 'Remove Favourite Successfully! Let it be!',
                duration: 5000,
                speed: 1000
              });
            }
          })
          .catch((err) => {

          })
      },

      actionComment() {
        if(this.isEditing) {
          this.updateComment()
        }
        else {
          this.sendComment()
        }
      },

      updateComment() {
        let url = this.host + '/comment/update'
        let payload = {
          comment_id: this.editing_comment.comment.id,
          comment: this.text
        }
        put(url, payload)
          .then(res => {
            if(res.data.status === true) {
              this.editing_comment.comment.comment = this.text
              this.$notify({
                group: 'foo',
                type: 'success',
                title: 'Update Comment Successfully',
                text: 'Update Comment Successfully! Let it be!',
                duration: 5000,
                speed: 1000
              });
            }
          })
          .catch(err => {

          })
          .finally(() => {
            this.resetEdit()
          })
      },

      sendComment() {
        let url = this.host + '/comment/create'
        let payload = {
          comment: this.text,
          food_id: this.product.id
        }
        post(url, payload)
          .then(res => {
            console.log(res)
            let comment = res.data.comment
            let user_name = this.current_user.last_name
            let user_avatar = this.current_user.avatar
            let c = {
              comment: comment,
              user_name: user_name,
              user_avatar: user_avatar
            }
            this.text = ''
            this.comment_list.unshift(c)
            this.$notify({
              group: 'foo',
              type: 'success',
              title: 'Comment Success',
              text: 'Comment Successfully! Let it be!',
              duration: 5000,
              speed: 1000
            });
          })
          .catch(err => {

          })
      }
    }
  }
</script>
<style scoped>
  .modal-body {
    overflow: hidden;
  }
  .avatar {
    width: 80px;
    height: 80px;
  }

  .fa-reply {
    margin-top: 20px;
    cursor: pointer;
  }

  .text-13 {
    font-size: 13px;
  }

  .media-comment {
    text-align: left;
  }

  .media-body {
    max-height: 220px;
    overflow: scroll;
  }

  .padding-left-0 {
    padding-left: 0px;
    margin-left: -10px;
  }

  .margin-top-20 {
    margin-top: 20px;
  }

  .margin-right-15 {
    margin-right: 15px;
  }

  .cursor-pointer {
    cursor: pointer;
  }

</style>

