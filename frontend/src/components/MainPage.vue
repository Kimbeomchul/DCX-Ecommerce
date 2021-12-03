<template>
<div id="app">
  <v-app id="inspire">
    <v-container fluid style="padding-top:60px;">
    <h1 class="font-weight-black">
        인기 많은 책
    </h1>
    <v-row>
        <v-col
        v-for="(book,index) in recommandBooks"
        :key="index"
        cols="4"
        >
        <v-card
            class="pa-2"
            outlined
        >
            <div>{{Number(index)+1}}위</div>
            <v-img
            :src="book.item_image"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
            >
            </v-img>
            <v-card-title v-text="book.item_title"></v-card-title>
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
        :key="category.item_section"
        >
        <v-btn @click="isCategoryClicked(category.item_section)">
            <v-card-title v-text="category.item_section"></v-card-title>
        </v-btn>
        </v-col>
    </v-row>
    <v-row>
        <v-col
        v-for="book in this.$store.state.filteredBooks"
        :key="book.item_code"
        cols= 6
        >
        <v-card>
            <v-img
            :src="book.item_image"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
            >

            <v-btn v-if="isZzimed(book.item_code)" icon>
                <v-icon color="red" @click="zzimClicked()">mdi-heart</v-icon>
            </v-btn>

            <v-btn v-else icon>
                <v-icon @click="zzimClicked()">mdi-heart</v-icon>
            </v-btn>

            <!-- <v-btn icon>
                <v-icon @click="zzimClicked(book.item_code)">shopping_bag</v-icon>
            </v-btn> -->
            </v-img>
            <router-link
              v-bind:to="{
                path: `/book/${book.item_title}`,
                params: { bookTitle: `${book.item_title}` },
              }"
            >
            <v-card-title v-text="book.item_title"></v-card-title>
            <v-card-text>{{ book.item_price }} 원</v-card-text>
            <v-card-actions>
            <v-spacer></v-spacer>
            </v-card-actions>
            </router-link>
        </v-card>
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
import store from '@/store/index.js';
import * as bookService from '../services/bookService'

export default {
  components: {

  },
  data: () => ({
    recommandBooks: [],
    books: store.state.books,
    books2: store.state.filteredBooks,
    zzims: store.state.zzims,
    categories: [],
  }),
  methods: {
    zzimClicked() {
      
    },
    isZzimed(it_code) {
      return store.state.zzims.find(zz => zz.item_code == it_code) ? true : false;
    },
    isCategoryClicked(category_name) {
      if (category_name == "전체") {
        store.commit('filterBooks', store.state.books);
      } else {
        const rich = store.state.books.filter(m => m.item_section == category_name);
        store.commit('filterBooks', rich);
      }
    }
  },
  async created() {
		this.recommandBooks = this.$store.state.recommandBooks;
    console.log('test',this.recommandBooks);
    store.dispatch('FETCH_BOOKS');
    store.dispatch('FETCH_ZZIM');
    store.dispatch('SAVE_FILTERBOOK');
    let categories = await bookService.getCategoryList();
    categories.unshift({ item_section: '전체'});
    this.categories = categories;
  }
}
</script>
