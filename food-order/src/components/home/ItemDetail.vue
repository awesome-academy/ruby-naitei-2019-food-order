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
                    <button type="button" class="btn btn-2" @click="orderFood(product)"><i class="fa fa-shopping-cart"></i> Order Food</button>
                    <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i class="fa fa-search"></i> Add to Favorite!</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="container col-md-6">
              <div class="row">
                <div class="col-sm-12" id="logout">
                  <div class="page-header">
                  </div>
                  <div class="comment-tabs">
                    <div class="tab-content tab-content-1">
                      <div class="tab-pane active" id="comments-logout">
                        <ul class="media-list">
                          <li class="media">
                            <a class="pull-left" href="#">
                              <img class="media-object img-circle" :src="handleAvatar(current_user.avatar)" alt="profile">
                            </a>
                            <div class="media-body">
                              <div class="well well-lg">
                                <h4 class="media-heading text-uppercase reviews">Marco </h4>
                                <span class="hoshi list-inline hoshi-1">
																												<span class="glyphicon glyphicon-star"></span>
																												<span class="glyphicon glyphicon-star"></span>
																												<span class="glyphicon glyphicon-star"></span>
																												<span class="glyphicon glyphicon-star"></span>
																												<span class="glyphicon glyphicon-star"></span>
																											</span>
                                <ul class="media-date text-uppercase reviews list-inline">
                                  <li class="dd">22</li>
                                  <li class="mm">09</li>
                                  <li class="aaaa">2014</li>
                                </ul>
                                <p class="media-comment">
                                  Great snippet! Thanks for sharing.
                                </p>
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="tab-pane active" id="comments-logout">
                        <ul class="media-list">
                          <li class="media">
                            <a class="pull-left" href="#">
                              <img class="media-object img-circle" :src="handleAvatar(current_user.avatar)" alt="profile">
                            </a>
                            <div class="media-body">
                              <div class="well well-lg">
                                <h4 class="media-heading text-uppercase reviews">Marco </h4>
                                <ul class="media-date text-uppercase reviews list-inline">
                                  <li class="dd">22</li>
                                  <li class="mm">09</li>
                                  <li class="aaaa">2014</li>
                                </ul>
                                <p class="media-comment">
                                  Great snippet! Thanks for sharing.
                                </p>
                              </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="tab-pane active" id="comments-logout">
                        <ul class="media-list">
                          <li class="media">
                            <a class="pull-left" href="#">
                              <img class="media-object img-circle" :src="handleAvatar(current_user.avatar)" alt="profile">
                            </a>
                            <div class="media-body">
                              <div class="well well-lg">
                                <h4 class="media-heading text-uppercase reviews">Marco </h4>
                                <ul class="media-date text-uppercase reviews list-inline">
                                  <li class="dd">22</li>
                                  <li class="mm">09</li>
                                  <li class="aaaa">2014</li>
                                </ul>
                                <p class="media-comment">
                                  Great snippet! Thanks for sharing.
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
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'ItemDetail',
    props: ["product"],
    data() {
      return {
        current_user: this.$store.state.auth.user,
        host: process.env.api_host,
      }
    },

    methods: {
      orderFood(product) {
        this.$emit('order', product)
        $('#close-popup').click()
      }
    }
  }
</script>
