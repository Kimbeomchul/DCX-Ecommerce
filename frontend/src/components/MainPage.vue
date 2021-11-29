<template>
<div id="app">
  <v-app id="inspire">
    <v-container fluid style="padding-top:60px;">
    <h1 class="font-weight-black">
        인기 많은 책
    </h1>
    <v-row>
        <v-col
        v-for="r in ranked"
        :key="r.rank"
        :cols="r.flex"
        >
        <v-card
            class="pa-2"
            outlined
        >
            <div>{{ r.rank }}위</div>
            <v-img
            :src="r.src"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
            >
            </v-img>
            <v-card-title v-text="r.title"></v-card-title>
        </v-card>
        </v-col>
    </v-row>
    </v-container>

    <v-container>
    <h1 class="font-weight-black" style="margin-bottom:10px">
        전체 목록
    </h1>
    <v-row
        align="center"
        justify="space-around"
    >
        <v-col
        v-for="category in categories"
        :key="category.name"
        >
        <v-btn depressed>
            <v-card-title v-text="category.name"></v-card-title>
        </v-btn>
        </v-col>
    </v-row>
    <v-row>
        <v-col
        v-for="book in this.$store.state.books"
        :key="book.item_code"
        cols= 6
        >
        <router-link
          v-bind:to="{
            path: `/book/${book.item_code}`,
            params: { index: `${book.item_code}` },
          }"
        >
        <v-card>
            <v-img
            :src="book.item_image"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
            >
            </v-img>
            <v-card-title v-text="book.item_title"></v-card-title>
            <v-card-text>{{ book.item_price }} 원</v-card-text>
            <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn icon>
                <v-icon @click="zzimClicked">mdi-heart</v-icon>
            </v-btn>
            </v-card-actions>
        </v-card>
        </router-link>
        </v-col>
    </v-row>
    </v-container>
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
export default {
  components: {

  },
  data: () => ({
    books: this.$store.state.books,
    ranked: [
      { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', rank: '1', flex: 4},
      { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', rank: '2', flex: 4},
      { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', rank: '3', flex: 4},
    ],
    categories: [
      { name: '소설' },
      { name: '시' },
      { name: '인문학' },
      { name: '종교' },
    ]
  }),
  methods: {
    zzimClicked() {
      this.
      console.log(this.$store.state.books.item_code + "클릭되었습니다.");
    },
  },
  created() {
    this.$store.dispatch('FETCH_BOOKS');
  }
}
</script>
