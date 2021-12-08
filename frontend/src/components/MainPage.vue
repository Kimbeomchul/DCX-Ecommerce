<template>
<div id="app">
  <v-app id="inspire" style="padding-top:60px">
  <SelectVue v-on:closed="getRecommandBooks" />
    <v-container v-if="recommandBooks.length > 0" fluid style="cursor: pointer">
    <h1 class="font-weight-black">
        {{user.member_name}}님을 위한 추천 도서
    <v-divider style="margin:0px 0px 10px"/>

    </h1>
    <v-row>
        <v-col
        v-for="(book,index) in recommandBooks"
        :key="index"
        cols="4"
        @click="goBookDetail(book)"
        >
        <v-card>
            <v-img
            :src="book.item_image"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
            >
            </v-img>
            <v-card-title>{{ book.item_title | limitName(10) }}</v-card-title>
            <v-card-text>{{ book.item_price | currency | won}}</v-card-text>
            <v-card-actions>
            <v-spacer></v-spacer>
            </v-card-actions>
        </v-card>
        </v-col>
    </v-row>
    </v-container>

    <v-container>
    <h1 class="font-weight-black">
        전체 목록
    </h1>
    <v-divider style="margin-top:0px"/>


    <v-tabs>
      <v-row>
      <v-col
      style="margin:auto"
      v-for="category in categories"
      :key="category.item_section">
        <v-tab @click="isCategoryClicked(category.item_section)">
          {{ category.item_section }}
        </v-tab>
      </v-col>
      </v-row>
    </v-tabs>

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

            <v-btn v-if="isZzimed(book.item_code)" @click="removeFromZzim(book.item_code)" icon>
              <v-icon class="reds" @click="heartClicked()">mdi-heart</v-icon>
            </v-btn>

            <v-btn v-else @click="addToZzim(book.item_code)" icon>
              <v-icon @click="heartClicked()">mdi-heart</v-icon>
            </v-btn>

            </v-img>
            <router-link
              style="text-decoration: none; color: inherit;"
              v-bind:to="{
                path: `/book/${book.item_title}`,
                params: { bookTitle: `${book.item_title}` },
              }"
            >
            <v-card-title v-text="book.item_title"></v-card-title>
            <v-card-text>{{ book.item_price |currency | won}}</v-card-text>
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
  .reds {
    color: red !important;
  }
</style>

<script>
import store from '@/store/index.js';
import * as bookService from '../services/bookService'
import * as userService from '../services/userService'
import * as dialogService from '../services/dialogService'
import view from '../constants/dialogCustomView'
import SelectVue from '../components/SelectBooks.vue'
import * as routerService from '../services/routerService'
import * as utils from '../util/utils'

export default {
  components: {
    SelectVue
  },
  data: () => ({
    dialog:false,
    recommandBooks: [],
    books: store.state.books,
    books2: store.state.filteredBooks,
    zzims: store.state.zzims,
    categories: [],
    user: {},
  }),
  methods: {
    goBookDetail(book) {
      const path = `/book/${book.item_title}`;
      const params =  { bookTitle: `${book.item_title}` };
      routerService.go(path, null, params)
    },
    async getRecommandBooks() {
      this.recommandBooks = await bookService.getRecommandBooks();
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
    },
    addToZzim(id) {
      if(!this.user) {
        dialogService.alertCustomComponent(view.LOGIN);
      } else {
        store.dispatch('ADD_ZZIM', id);
      }
    },
    removeFromZzim(id) {
      store.dispatch('REMOVE_ZZIM', id);
    },
    heartClicked() {
      let message = '';
      if(event.target.classList.contains('reds')){
        // '찜을 취소합니다' 팝업띄우기
        if(!utils.isEmptyObject(this.user)) {
          message = '찜을 취소합니다';
          dialogService.alert(message);
          event.target.classList.remove('reds');
        }
      }else{
        // '해당 도서를 찜했습니다' 팝업띄우기
        if(!utils.isEmptyObject(this.user)) {
          message = '해당 도서를 찜했습니다';
          dialogService.alert(message);
          event.target.classList.add('reds');
        }
      }
    }
  },
  async created() {
    store.dispatch('FETCH_BOOKS');
    store.dispatch('SAVE_FILTERBOOK');
    let categories = await bookService.getCategoryList();
    categories.unshift({ item_section: '전체'});
    this.categories = categories;
    this.user = userService.getUser();
    if(this.user) {
      store.dispatch('FETCH_ZZIM');
      if(!this.user.need_book_reccomand) {
        await this.getRecommandBooks();
      } 
    }
  }
}
</script>
