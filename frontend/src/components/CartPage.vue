<template>
<div id="app">
  <v-app id="inspire">
    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
    <v-container fluid style="padding-top:60px;">

    <h3>장바구니</h3>

    <Empty v-if="books.length === 0" iconName="mdi-cart-remove" message="장바구니가 비었습니다." />

    <v-list three-line>
    <template v-for="(book, index) in books">
      <v-divider :key="index" />
      <v-list-item
      :key="book.item_title"
      multiple
      v-model="buying"
      >
        <template>
          <v-list-item-action>
            <v-checkbox v-model="buying" :value="book"></v-checkbox>
          </v-list-item-action>
          <v-img
          :src="book.item_image"
          max-height="50px"
          max-width="50px"
          style="margin-right:10px; cursor: pointer"
          @click="goBookDetail(book)"
          ></v-img>

          <v-list-item-content @click="goBookDetail(book)" style="cursor: pointer">
            <v-list-item-title v-html="book.item_title"></v-list-item-title>
            <v-list-item-subtitle >
              <span class="text--primary">
                {{book.item_price | currency | won}}
              </span>
            </v-list-item-subtitle>
          </v-list-item-content>
          <v-list-item-action>
            <v-icon @click="removeItem(book)">mdi-trash-can</v-icon>
          </v-list-item-action>
        </template>
      </v-list-item>
      </template>
    </v-list>

	</v-container>

	<v-footer
		v-bind="localAttrs"
	>
		<v-card
		width="100%"
		class="text-center"
		>
			<v-card-text
				class="bottom-btn"
			>
				<h4>총 {{ total_price | currency }} 원</h4>
				<v-btn
					color="primary"
					elevation="2"
					width="90%"
          @click="goOrder"
				>
					구매하기
				</v-btn>
			</v-card-text>
		</v-card>
	</v-footer>

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
import * as basketService from '../services/basketService'
import * as routerService from '../services/routerService'
import {ROUTES} from '../constants/routes'
import * as utils from '../util/utils'
import Empty from '../components/empty.vue'

export default {
  components: {
    Empty
  },
  async created() {
    await this.init();
  },
  methods: {
    async init() {
      this.books = await basketService.getBasket();
      this.buying = this.books;
      this.$store.dispatch('INIT_NEW_CART_ITEMS');
    },
    goBookDetail(book) {
      const path = `/book/${book.item_title}`;
      const params =  { bookTitle: `${book.item_title}` };
      routerService.go(path, null, params)
    },
    async removeItem(book) {
      await basketService.deleteBasket(book.item_code);
      await this.init();
    },
    goOrder() {
      utils.setLocalstorageItem('buyItems', this.buying);
      routerService.go(ROUTES.ORDER)
    }
  },
  data: () => ({
    books: [],
    buying: [],
  }),
  computed: {
		localAttrs () {
			const attrs = {}
			attrs['fixed'] = true
			return attrs
		},
    total_price () {
      return this.buying.reduce((acc, cur) => acc + cur.item_price, 0);
    }
	},
  
  }
</script>
