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
                  <li class="row">
                    <div class="col-md-7 amout">Com xa xiu trung ran</div>
                    <div class="col-md-5">3 x 30k</div>
                  </li>
                  <li class="row">
                    <div class="col-md-7 amout">Com xa xiu trung ran</div>
                    <div class="col-md-5">2 x 20k</div>
                  </li>
                  <li class="row">
                    <div class="col-md-7 amout">Com xa xiu trung ran</div>
                    <div class="col-md-5">1 x 10k</div>
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
                <a href="#">100$</a>
              </div>
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-1"><span class="glyphicon glyphicon-heart"></span> SUBMIT</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'orderList',

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
        $('.count').prop('disabled', true);
        $(document).on('click','.plus',function(){
          $('.count').val(parseInt($('.count').val()) + 1 );
        });
        $(document).on('click','.minus',function(){
          $('.count').val(parseInt($('.count').val()) - 1 );
          if ($('.count').val() == -1) {
            $('.count').val(0);
          }
        });
      });
    }
  }

</script>
