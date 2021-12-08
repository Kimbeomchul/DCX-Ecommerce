<template>
<div id="app">
  <v-app id="inspire">

    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
    <v-container fluid style="padding-top:60px;">

	<h3>찜목록</h3>
  <Empty v-if="this.$store.state.zzims.length === 0" iconName="mdi-heart-broken" message="찜한 도서가 없습니다." />

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
			style="margin-right:10px; cursor: pointer"
      @click="goBookDetail(item.item_code)"
			></v-img>

			<v-list-item-content 
      @click="goBookDetail(item.item_code)"
      style="cursor: pointer"
      >
				<v-list-item-title @click="tclicked">{{ isZzimed(item.item_code).item_title }}</v-list-item-title>
				<v-list-item-subtitle>{{ isZzimed(item.item_code).item_price | currency | won}}</v-list-item-subtitle>
			</v-list-item-content>
      <v-list-item-action>
        <v-icon @click="removeItem(item.item_code)">mdi-trash-can</v-icon>
    </v-list-item-action>
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
import * as zzimService from '../services/zzimService'
import * as routerService from '../services/routerService'
import Empty from '../components/empty.vue'

export default {
  components: {
    Empty
  },
  data: () => ({
    zzims: store.state.zzims,
    books: store.state.books
  }),
  methods: {
    goBookDetail(itemCode) {
      const book = this.isZzimed(itemCode);
      const path = `/book/${book.item_title}`;
      const params =  { bookTitle: `${book.item_title}` };
      routerService.go(path, null, params)
    },
    init() {
      store.dispatch('FETCH_ZZIM');
      store.dispatch('FETCH_BOOKS');
    },
    async removeItem(itemCode) {
      await zzimService.deleteZzim(itemCode);
      this.init();
    },
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
    this.init();
  }
  }
</script>