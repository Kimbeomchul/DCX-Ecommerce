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
		:key="index"
		>
			<v-img
			:src="$store.state.books[item.item_code].item_image"
			max-height="50px"
			max-width="50px"
			style="margin-right:10px;"
			></v-img>

			<v-list-item-content>
				<v-list-item-title @click="tclicked">{{ $store.state.books[item.item_code].item_title }}</v-list-item-title>
				<v-list-item-subtitle v-html="item.subtitle">{{ $store.state.books[item.item_code].item_price }}</v-list-item-subtitle>
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
import HeaderWrapper from "@/components/Header";

export default {
  components: {
    HeaderWrapper
  },
  data: () => ({
    zzims: this.$store.state.zzims,
    books: this.$store.state.books
  }),
  methods: {
    tclicked() {
      console.log(this.zzims);
      console.log(this.$store.state.books[1].item_title);
    }
  },
  created() {
    this.$store.dispatch('FETCH_ZZIM');
    this.$store.dispatch('FETCH_BOOKS');
  }
  }
</script>
