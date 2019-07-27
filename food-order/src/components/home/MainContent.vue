<template>
  <div>
    <div id="particles" class="gtco-section">
      <div class="gtco-container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
            <h2 class="cursive-font">DogsLand Restaurant</h2>
            <p>Today Menu</p>
          </div>
        </div>
        <div class="row row-1">
          <div class="col-md-4">
            <div class="thumbnail">
              <div id="myCarousel-5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel-5" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel-5" data-slide-to="1"></li>
                  <li data-target="#myCarousel-5" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active content">
                    <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel-5" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel-5" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">Chicken Rice</a></h4>
                <h4>$700.99</h4>
                <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                  unknown printer took a galley of tk.</p>
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
                  <span class="minus bg-dark">-</span>
                  <input type="number" class="count" name="qty" value="0">
                  <span class="plus bg-primary">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i
                  class="fa fa-search" @click="showDetail"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="thumbnail">
              <div id="myCarousel-5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel-5" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel-5" data-slide-to="1"></li>
                  <li data-target="#myCarousel-5" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active content">
                    <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel-5" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel-5" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">Chicken Rice</a></h4>
                <h4>$700.99</h4>
                <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                  unknown printer took a galley of tk.</p>
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
                  <span class="minus bg-dark">-</span>
                  <input type="number" class="count" name="qty" value="0">
                  <span class="plus bg-primary">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i
                  class="fa fa-search" @click="showDetail"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="thumbnail">
              <div id="myCarousel-5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel-5" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel-5" data-slide-to="1"></li>
                  <li data-target="#myCarousel-5" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active content">
                    <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel-5" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel-5" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">Chicken Rice</a></h4>
                <h4>$700.99</h4>
                <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                  unknown printer took a galley of tk.</p>
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
                  <span class="minus bg-dark">-</span>
                  <input type="number" class="count" name="qty" value="0">
                  <span class="plus bg-primary">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i
                  class="fa fa-search" @click="showDetail"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="thumbnail">
              <div id="myCarousel-5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel-5" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel-5" data-slide-to="1"></li>
                  <li data-target="#myCarousel-5" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active content">
                    <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel-5" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel-5" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">Chicken Rice</a></h4>
                <h4>$700.99</h4>
                <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                  unknown printer took a galley of tk.</p>
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
                  <span class="minus bg-dark">-</span>
                  <input type="number" class="count" name="qty" value="0">
                  <span class="plus bg-primary">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i
                  class="fa fa-search" @click="showDetail"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="thumbnail">
              <div id="myCarousel-5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel-5" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel-5" data-slide-to="1"></li>
                  <li data-target="#myCarousel-5" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active content">
                    <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel-5" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel-5" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">Chicken Rice</a></h4>
                <h4>$700.99</h4>
                <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                  unknown printer took a galley of tk.</p>
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
                  <span class="minus bg-dark">-</span>
                  <input type="number" class="count" name="qty" value="0">
                  <span class="plus bg-primary">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i
                  class="fa fa-search" @click="showDetail"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="thumbnail">
              <div id="myCarousel-5" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel-5" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel-5" data-slide-to="1"></li>
                  <li data-target="#myCarousel-5" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active content">
                    <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                  </div>

                  <div class="item content">
                    <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                  </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel-5" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel-5" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
              <div class="caption">
                <h4><a href="#">Chicken Rice</a></h4>
                <h4>$700.99</h4>
                <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                  unknown printer took a galley of tk.</p>
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
                  <span class="minus bg-dark">-</span>
                  <input type="number" class="count" name="qty" value="0">
                  <span class="plus bg-primary">+</span>
                </div>
              </div>
              <div class="space-ten"></div>
              <div class="btn-ground text-center">
                <button type="button" class="btn btn-2"><i class="fa fa-shopping-cart"></i> Order Food</button>
                <button type="button" class="btn btn-3" data-toggle="modal" data-target="#product_view"><i
                  class="fa fa-search" @click="showDetail"></i> Quick View
                </button>
              </div>
              <div class="space-ten"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <item-detail v-show="showPopup"/>
  </div>
</template>
<script>
  import ItemDetail from './ItemDetail'

  export default {
    name: 'MainContent',
    data() {
      return {
        showPopup: false,
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
    },

    methods: {
      showDetail() {
        this.showPopup = true
      }
    }
  }
</script>
