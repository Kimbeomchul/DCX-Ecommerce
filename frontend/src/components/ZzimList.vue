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

	<h3>찜목록</h3>
	<v-list three-line>
	<template v-for="(item, index) in this.$store.state.zzims">
		<v-divider :key="index"></v-divider>

		<v-list-item
		:key="item.zzim_no"
		>
			<v-img
			:src="zzimedImage(item.item_code)"
			max-height="50px"
			max-width="50px"
			style="margin-right:10px;"
			></v-img>

			<v-list-item-content>
				<v-list-item-title @click="tclicked">{{ isZzimed(item.item_code).item_title }}</v-list-item-title>
				<v-list-item-subtitle v-html="item.subtitle">{{ isZzimed(item.item_code).item_price }}</v-list-item-subtitle>
			</v-list-item-content>
		</v-list-item>
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
import store from '@/store/index.js';
import HeaderWrapper from "@/components/Header";

export default {
  components: {
    HeaderWrapper
  },
  data: () => ({
    zzims: store.state.zzims,
    books: store.state.books
  }),
  methods: {
    tclicked() {
      //console.log(store.state.zzims);
      //console.log(store.state.books[1].item_title);
    },
    isZzimed(it_code) {
      if (this.$store.state.books.find(bk => bk.item_code == it_code) !== undefined)
        return this.$store.state.books.find(bk => bk.item_code == it_code);
    },
    zzimedImage(it_code) {
      if (this.$store.state.books.find(bk => bk.item_code == it_code) !== undefined)
        return this.$store.state.books.find(bk => bk.item_code == it_code).item_image;
    },
  },
  created() {
    store.dispatch('FETCH_ZZIM');
    store.dispatch('FETCH_BOOKS');
  }
  }
</script>