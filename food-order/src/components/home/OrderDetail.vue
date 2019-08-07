<template>
  <div class="modal fade orderDetail" id="order_detail" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <a href="#" id="close-popup-detail" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>

        </div>
        <div class="modal-body">
          <div class="table-responsive">
            <table class="table">
              <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Image</th>
                <th scope="col" class="margin-left-10">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Total</th>
              </tr>
              </thead>
              <tbody>
                <tr v-for="(order, index) in current_order.orderList">
                  <th scope="row">{{index + 1}}</th>
                  <td>{{order.name}}</td>
                  <td><div><img :src="host + order.images[0].image_link" :alt="order.name" class="img-responsive img-cus"></div> </td>
                  <td>
                    <div class="qty">
                      <span class="minus bg-dark" @click="$emit('decreaseNumber', order, -1)" :disabled="!order.number">-</span>
                      <input type="number" class="count" name="qty" :value="order.number" min="0">
                      <span class="plus bg-primary" @click="$emit('increaseNumber', order, 1)">+</span>
                    </div>
                  </td>
                  <td>{{order.default_price}}</td>
                  <td>{{totalPrice(order)}}$</td>
                </tr>
              </tbody>
              <tfoot>
                <tr class="table-info">
                  <td colspan="5" class="text-center">Total Price</td>
                  <td class="text-danger">{{total}}$</td>
                </tr>
                <tr>
                  <td colspan="5" class="text-center">Discount</td>
                  <td class="text-info"> - {{$store.state.today_discount}}%</td>
                </tr>
                <tr class="table-info">
                  <td colspan="5" class="text-center">Order Total</td>
                  <td class="text-success">{{orderTotal}}$</td>
                </tr>
              </tfoot>
            </table>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-1">Submit Order</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    name: 'OrderDetail',
    props: ["product"],
    data() {
      let current_order = this.$store.state.orderList.filter(o => o.user_id === this.$store.state.auth.user.id)
      return {
        current_user: this.$store.state.auth.user,
        host: process.env.api_host,
        orderList: this.$store.state.orderList,
        current_order: current_order.length ? current_order[0] : {orderList: []},
      }
    },

    watch: {
      'orderList': function () {
        let current_order = this.$store.state.orderList.filter(o => o.user_id === this.$store.state.auth.user.id)
        this.current_order = current_order.length ? current_order[0] : {orderList: []}
      }
    },

    computed: {
      total: function() {
        let t = 0
        this.current_order.orderList.forEach(o => {
          t = t + this.totalPrice(o)
        })
        return t
      },

      orderTotal: function() {
        return this.total * (100 - this.$store.state.today_discount)/100
      }
    },

    methods: {
      orderFood(product) {
        this.$emit('order', product)
        $('#close-popup').click()
      },

      totalPrice(order) {
        return order.number * order.default_price
      },
    }
  }
</script>
<style>
  th {
    color: #d58512;
  }

  .img-responsive {
    width: 2em;
    height: 2em;
  }

  tr {
    text-align: left;
    color: #2E2F30;
  }

  .qty {
    max-width: 170px;
  }

  .margin-left-10 {
    padding-left: 30px;
  }

  .modal-dialog {
    max-height: 450px;
  }
</style>
