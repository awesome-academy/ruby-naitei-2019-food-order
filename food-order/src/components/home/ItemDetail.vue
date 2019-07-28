<template>
  <div class="modal fade product_view" id="product_view">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>

        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6 product_img">
              <div class="col-md-12">
                <div class="thumbnail-1 thumbnail">
                  <div id="myCarousel-9" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <li data-target="#myCarousel-9" data-slide-to="0" class="active"></li>
                      <li data-target="#myCarousel-9" data-slide-to="1"></li>
                      <li data-target="#myCarousel-9" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="item active content-1">
                        <img src="/static/images/food.jpg" alt="Los Angeles" class="img-responsive img-cus">
                      </div>

                      <div class="item content-1">
                        <img src="/static/images/bg.jpg" alt="Chicago" class="img-responsive img-cus">
                      </div>

                      <div class="item content-1">
                        <img src="/static/images/img_2.jpg" alt="New york" class="img-responsive img-cus">
                      </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel-9" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel-9" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                  <div class="caption">
                    <h4><a href="#">Chicken Rice</a></h4>
                    <h4>$700.99</h4>
                    <p class="naiyo">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of tk.</p>
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
                              <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
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
                              <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
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
                              <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
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
    name: 'ItemDetail'
  }
</script>
