<template>
  <div>
    <div id="particles" class="gtco-section">
      <div class="gtco-container">
        <div class="row">
          <div class="col-md-10 text-center gtco-heading">
            <h2 class="cursive-font">{{restaurant_name}} Restaurant</h2>
            <p>Today Menu</p>
          </div>
          <div class="col-md-2">
            <button type="button" class="btn btn-5" v-if="dark_mode" @click="offDarkMode">DarkMode: ON</button>
            <button type="button" class="btn btn-5" v-else @click="onDarkMode">LightMode: ON</button>
          </div>
        </div>
        <div class="row row-1">
          <div class="col-md-4" v-for="food in foods">
            <div class="thumbnail">
              <div :id="`myCarousel` + food.id" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li :data-target="`#myCarousel` + food.id" :data-slide-to="index" v-for="(img, index) in food.images" :class="(index === 0) ? 'active' : ''"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item content" v-for="(img, index) in food.images" :class="(index === 0) ? 'active' : ''">
                    <img :src="host + img.image_link" :alt="img.image_link" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" :href="`#myCarousel` + food.id" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" :href="`#myCarousel` + food.id" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">{{food.name}}</a></h4>
                <h4>${{formatCurrency(food.default_price)}}</h4>
                <p class="naiyo">{{food.description}}</p>
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
                  <span class="minus bg-dark" @click="decreaseNumber(food, -1)" :disabled="!food.number">-</span>
                  <input type="number" class="count" name="qty" :value="food.number" min="0">
                  <span class="plus bg-primary" @click="increaseNumber(food, 1)">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2" @click="order(food)"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view" @click="showDetail(food)"><i
                  class="fa fa-search"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <item-detail v-show="showPopup" :product="detailProduct" @decreaseNumber="decreaseNumber" @increaseNumber="increaseNumber" @order="order" @closePopUp="closePopUp"/>
  </div>
</template>
<script>
  import ItemDetail from './ItemDetail'
  import {get} from '../../helper/request'
  export default {
    name: 'MainContent',
    data() {
      return {
        dark_mode: true,
        showPopup: false,
        foods: [],
        food_images: [],
        restaurant_name: '',
        restaurant_id: 0,
        current_user: this.$store.state.auth.user,
        host: process.env.api_host,
        detailProduct: {},
        dark_mode_url: 'url(data:image/gif;base64,R0lGODlhBAAEAKECABERESQkJP///////yH5BAEKAAIALAAAAAAEAAQAAAIFhB6nhlIAOw==)',
        light_mode_url: 'linear-gradient(to right, #a1c4fd 0%, #0e0e0e 51%, #a1c4fd 100%)',
        rain_bow_mode_url: 'linear-gradient(to right, #4f5e77 0%, #652323 51%, #7c824b 100%)',
        background_image: window.localStorage.getItem('background_image') ? window.localStorage.getItem('background_image') : this.dark_mode_url
      }
    },
    components: {
      ItemDetail: ItemDetail
    },

    mounted() {
      particleground(document.getElementById('particles'), {
        dotColor: '#5cbdaa',
        lineColor: '#5cbdaa'
      });


      this.loadListFoods()
      if(this.background_image != this.dark_mode_url) {
        this.dark_mode = false
      }
      this.showMode()
    },

    created() {
    },

    methods: {
      showDetail(food) {
        console.log(food)
        this.showPopup = true
        this.detailProduct = food
      },

      loadListFoods() {
        let url = process.env.api_host + '/food/list'
        get(url)
          .then((res) => {
          this.foods = res.data.foods
          this.food_images = res.data.food_images
          this.restaurant_name = res.data.res_name
          this.restaurant_id = res.data.res_id
          this.mergeFoodAndImages()
        })
          .finally(() => {
          })
      },

      mergeFoodAndImages() {
        this.foods.forEach((f, index) => {
          this.$set(f, 'images', this.food_images[index])
          this.$set(f, 'number', 0)
        })
      },

      decreaseNumber(food, number) {
        if(food.number > 0) {
          food.number += number
        }
      },

      increaseNumber(food, number) {
        food.number += number
      },

      order(food) {
        let f = Object.assign({}, food)
        if(!f.number) {
          console.log(1);
          f.number = 1
        }
        let orderList = this.$store.state.orderList.filter((o) => o.user_id === this.current_user.id)
        if(!orderList.length) {
          let order = {
            user_id : this.current_user.id,
            orderList : [f]
          }
          this.$store.state.orderList.push(order)
        } else {
          let ordered = orderList[0].orderList.filter((o) => o.id === f.id)
          if(ordered.length) {
            ordered[0].number = ordered[0].number + f.number
          } else {
            orderList[0].orderList.push(f)
          }
        }
        food.number = 0
        window.localStorage.setItem('orderList', JSON.stringify(this.$store.state.orderList))
      },

      showMode() {
        $('canvas').css('background-image', this.background_image)
      },

      offDarkMode() {
        this.dark_mode = false
        this.background_image = this.rain_bow_mode_url
        $('canvas').css('background-image', this.background_image)
        window.localStorage.setItem('background_image', this.background_image)
      },

      onDarkMode() {
        this.dark_mode = true
        this.background_image = this.dark_mode_url
        $('canvas').css('background-image', this.background_image)
        window.localStorage.setItem('background_image', this.background_image)
      },

      closePopUp() {
        this.showPopup = false
        this.detailProduct = {}
      }
    },
  }
</script>
<style>
  .btn-5 {
    background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 51%, #ffecd2 100%);
  }

  canvas{
    background-image: url(data:image/gif;base64,R0lGODlhBAAEAKECABERESQkJP///////yH5BAEKAAIALAAAAAAEAAQAAAIFhB6nhlIAOw==);
    background-color: rgb(24, 24, 24) !important;
    background-repeat: repeat !important;
  }
</style>
