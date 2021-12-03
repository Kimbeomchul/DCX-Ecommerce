<template>
<div id="app">
  <v-app id="inspire">
    <HeaderWrapper />

    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
    <v-container fluid style="padding-top:60px;">

	<h3>구매내역</h3>
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

      <template v-for="(itemCode, index2) in order.itemCodes">
        <v-list-item
        :key="index1 + index2 + index1 + 20 * index2 *20"
        v-bind:to = "{
            path: `/book/${books[itemCode].item_title}`,
            params: { bookTitle: `${books[itemCode].item_title}` },
        }">
          <v-img
          :src="books[itemCode].item_image"
          max-height="50px"
          max-width="50px"
          style="margin-right:10px;"
          ></v-img>

          <v-list-item-content>
            <v-list-item-title v-html="books[itemCode].item_title"></v-list-item-title>
            <v-list-item-subtitle>
              <span>
                {{books[itemCode].item_price | currency | won}}
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
import HeaderWrapper from "@/components/Header";
import * as payService from '../services/payService';
import * as bookService from '../services/bookService';

export default {
    components: {
      HeaderWrapper
    },
    data: () => ({
      books: [],
      orders: [],
     }),
      async created() {
        this.books = await bookService.getBookList();
        this.orders = await payService.getOrderList();
      },
  }
</script>
