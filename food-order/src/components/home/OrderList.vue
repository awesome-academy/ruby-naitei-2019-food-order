<template>
  <div class="row mx-auto">
    <div id="clockdiv" style="margin: auto">
      <div>
        <span class="minutes"></span>
        <div class="smalltext">Minutes</div>
      </div>
      <div>
        <span class="seconds"></span>
        <div class="smalltext">Seconds</div>
      </div>
    </div>
    <div class="form-wrap">
      <div class="tab">

        <div class="tab-content">
          <div class="tab-content-inner active" data-content="signup">
            <h3 class="cursive-font">Ordered Foods</h3>
            <hr>
            <div class="row">
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-8">
                    <a href="#">Name Foods</a>
                  </div>
                  <div class="col-md-3">
                    <a href="#">Count</a>
                  </div>
                </div>
                <ul class="food-name">
                  <li class="row" v-for="food in current_order.orderList">
                    <div class="col-md-7 amout">{{food.name}}</div>
                    <div class="col-md-5">{{food.number}} x {{formatCurrency(food.default_price)}}$</div>
                  </li>
                </ul>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-8">
                <a href="#">Total:</a>
              </div>
              <div class="col-md-3">
                <a href="#">{{formatCurrency(total_price)}}$</a>
              </div>
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-1" @click="submitOrder"><span class="glyphicon glyphicon-heart"></span> ORDER</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import {post} from '../../helper/request'
  export default {
    name: 'orderList',

    data() {
      let current_order = this.$store.state.orderList.filter(o => o.user_id === this.$store.state.auth.user.id)
      return {
        current_user: this.$store.state.auth.user,
        orderList: this.$store.state.orderList,
        current_order: current_order.length ? current_order[0] : {orderList: []}
      }
    },

    computed: {
      'total_price': function() {
        let total = 0
        this.current_order.orderList.forEach((o) => {
          total += (o.number * o.default_price)
        })
        return total
      },
    },

    watch: {
      'orderList': function () {
        let current_order = this.$store.state.orderList.filter(o => o.user_id === this.$store.state.auth.user.id)
        this.current_order = current_order.length ? current_order[0] : {orderList: []}
      }
    },

    mounted() {
      function getTimeRemaining(endtime) {
        var t = Date.parse(endtime) - Date.parse(new Date());
        var seconds = Math.floor((t / 1000) % 60);
        var minutes = Math.floor((t / (1000 * 60)) % 24);
        return {
          'total': t,
          'minutes': minutes,
          'seconds': seconds
        };
      }

      function initializeClock(id, endtime) {
        var clock = document.getElementById(id);
        var minutesSpan = clock.querySelector('.minutes');
        var secondsSpan = clock.querySelector('.seconds');

        function updateClock() {
          var t = getTimeRemaining(endtime);

          minutesSpan.innerHTML = (t.minutes);
          secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

          if (t.total <= 0) {
            clearInterval(timeinterval);
          }
        }

        updateClock();
        var timeinterval = setInterval(updateClock, 1000);
      }

      $(document).ready(function(){
        var deadline = new Date(Date.parse(new Date()) + 24 * 60 * 1000);
        initializeClock('clockdiv', deadline);

      });
    },

    methods: {
      submitOrder() {
        let url = process.env.api_host + '/submit-order'
        let payload = {
          orders: this.current_order.orderList
        }
        post(url, payload)
          .then(res => {
            console.log('res: ', res)
            let index = this.$store.state.orderList.indexOf(this.current_order)
            if(index > 0) {
              this.$store.state.orderList.splice(index, 1)
              window.localStorage.setItem('orderList', JSON.stringify(this.$store.state.orderList))
              this.$notify({
                group: 'foo',
                type: 'success',
                title: 'Order Successfully',
                text: 'Thanks for your order! Let it be!',
                duration: 5000,
                speed: 1000
              });
            }
          })
      }
    }
  }

</script>
