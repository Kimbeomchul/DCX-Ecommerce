<template>
  <v-row>
    <v-col
      v-for="(book,index) in books"
      :key="book.item_code"
      class="d-flex child-flex"
      cols="4"
    >
      <v-img
        :key="index"
        :src="book.item_image"
        aspect-ratio="1"
        class="grey lighten-2"
        :class="book.class"
        @click="select(book)"
      >
        <template v-slot:placeholder>
          <v-row
            class="fill-height ma-0"
            align="center"
            justify="center"
          >
            <v-progress-circular
              indeterminate
              color="grey lighten-5"
            ></v-progress-circular>
          </v-row>
        </template>
      </v-img>
    </v-col>
  </v-row>
</template>

<script>
import * as bookService from '../services/bookService';
import * as routerService from '../services/routerService'
import {ROUTES} from '../constants/routes'
import store from '@/store/index.js';

    export default {
        name: 'Login',
        data() {
            return {
                limit: 5,
                books: [],
            }
        },
        methods: {
          async select(book) {
            book.selected = !book.selected;

            const selectedBooks = this.books.filter(v => v.selected);

            if(selectedBooks.length >= this.limit) {
              const recommandBooks = await bookService.getRecommandBooks(selectedBooks);
              this.$dialog.destroy();
              store.dispatch("SET_RECOMMAND_BOOKS", recommandBooks)
              routerService.go(ROUTES.MAIN);
            }
          }
        },
        async created() {
            this.books = await bookService.getBookRandom();
            this.books.forEach(v => {
                v.selected = false;
            })
        }
    }
</script>

<style scoped>
.selected {
opacity: 0.5
}
</style>