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
			src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
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
				>
					장바구니에 담기
				</v-btn>
				<v-btn
					color="primary"
					elevation="2"
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

export default {
	name: "ProductDetail",
	components: {
		HeaderWrapper
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
			return this.$store.state.id;
		}
	},
	created() {
		const bookId = this.$route.params.bookId;
		this.$store.dispatch("FETCH_BOOK", bookId);
	}
}
</script>
