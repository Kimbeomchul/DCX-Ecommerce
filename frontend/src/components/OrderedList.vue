<template>
<div id="app">
  <v-app id="inspire">

    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
    <v-container fluid style="padding-top:60px;">

	<h3>구매내역</h3>
  <Empty v-if="orders.length === 0" iconName="mdi-cash-100" message="주문 내역이 없습니다." />

	<v-list
	subheader
	three-line
	>
		<template v-for="(order, index1) in orders">
			<v-subheader
			:key="order.payKakao"
			v-text="`No.${order.payKakao}`"
			></v-subheader>

			<v-divider :key="'A' + order.payKakao" />

      <template v-for="(item, index2) in order.items">
        <v-list-item
        :key="index1 + index2 + index1 + 20 * index2 *20"
        v-bind:to = "{
            path: `/book/${item.item_title}`,
            params: { bookTitle: `${item.item_title}` },
        }">
          <v-img
          :src="item.item_image"
          max-height="50px"
          max-width="50px"
          style="margin-right:10px;"
          ></v-img>

          <v-list-item-content>
            <v-list-item-title v-html="item.item_title"></v-list-item-title>
            <v-list-item-subtitle>
              <span>
                {{item.item_price | currency | won}}
              </span>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>
		</template>
    </v-list>
    </v-container>
    </v-sheet>
  </v-app>
</div>
</template>

<style lang="scss" scoped>
  .like-button {
    position:absolute;
    width:100%;
  }

</style>

<script>
import * as payService from '../services/payService';
import Empty from '../components/empty.vue'

export default {
    components: {
      Empty
    },
    data: () => ({
      books: [],
      orders: [],
     }),
      async created() {
        this.orders = await payService.getOrderList();
      },
  }
</script>