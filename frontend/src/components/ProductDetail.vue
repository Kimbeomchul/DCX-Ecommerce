<template>
<div id="product-detail">
	<v-app id="inspire">
		<HeaderWrapper />

	<v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
	>

	<v-container fluid style="padding-top:60px;">
		<v-img
			height="450"
			:src="bookInfo.item_image"
		>
			<v-btn icon>
				<v-icon>mdi-heart</v-icon>
			</v-btn>
		</v-img>

        <v-card-title>{{ bookInfo.item_title }}</v-card-title>

		<v-card-text>
			<div>{{ bookInfo.item_price }} 원</div>
		</v-card-text>

		<v-divider class="mx-4"></v-divider>

		<v-card-text>
			<div>
			{{ bookInfo.item_writer }} 저서
			</div>
			<div>
			{{ bookInfo.item_content }}
			</div>
		</v-card-text>

	</v-container>

	<v-footer
		v-bind="localAttrs"
		:padless="padless"
	>
		<v-card
		width="100%"
		class="text-center"
		>
			<v-card-text
				class="bottom-btn"
			>
				<v-btn
					color="primary"
					elevation="2"
					outlined
					style="margin-right:50px;"
					@click="addCart"
				>
					장바구니에 담기
				</v-btn>
				<v-btn
					color="primary"
					elevation="2"
					@click="goOrder"
				>
					바로 구매하기
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
import HeaderWrapper from "@/components/Header";
import * as basketService from '../services/basketService'
import * as dialogService from '../services/dialogService'
import * as utils from '../util/utils'
import * as routerService from '../services/routerService'
import {ROUTES} from '../constants/routes'


export default {
	name: "ProductDetail",
	components: {
		HeaderWrapper
	},
	beforeRouteUpdate(to, from ,next) {
		const path = to.path.split('/').pop();
		const routes = this.$router.options.routes;

		if(routes.findIndex(v => v.name) !== -1) {
			next({name: path});
		}
		next();
	},
	methods: {
		async addCart() {
			const cartList = await basketService.getBasket();
			const index = cartList.findIndex(v => this.bookInfo.item_code === v.item_code);
			if(index !== -1) {
				dialogService.alert('이미 추가된 도서 입니다.');
				return ;
			} else {
				await basketService.addBasket(this.$store.state.book.item_code);
				this.$store.dispatch('ADD_NEW_CART_ITEMS');
				dialogService.alert('추가되었습니다.');
			}
		},
		goOrder() {
			utils.setLocalstorageItem('buyItems', [this.$store.state.book]);
			routerService.go(ROUTES.ORDER)
		}
	},
	data: () => ({
		selection: 1,
		padless: false,
	}),
	computed: {
		localAttrs () {
			const attrs = {}
			attrs['fixed'] = true
			return attrs
		},
		bookInfo() {
			return this.$store.state.book;
		}
	},
	created() {
		const bookTitle = this.$route.params.bookTitle;
		this.$store.dispatch("FETCH_BOOK", bookTitle);
	}
}
</script>
