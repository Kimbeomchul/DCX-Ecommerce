<template>
  <v-row>
    <v-col
      v-for="book in books"
      :key="book.item_code"
      class="d-flex child-flex"
      cols="4"
      :style="{ 'opacity': book.selected ? 0.5 : 1 }"
    >
      <v-img
        :src="book.item_image"
        @click="select(book, book.item_code)"
      >
        <!-- aspect-ratio="1"
        class="grey lighten-2" -->
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
import * as dialogService from '../services/dialogService'
import * as bookService from '../services/bookService'
    export default {
        name: 'Login',
        data() {
            return {
                limit: 3,
                books: [],
            }
        },
        methods: {
            select(book, id) {
                if(book.selected) {
                    book.selected = !book.selected;
                    return ;
                }

                const count = this.books.filter(v => v.selected).length;
                if(count >= this.limit) {
                    dialogService.alert('관심 책은 최대 3개만 선택 가능합니다.');
                    return ;
                } else {
                    book.selected = !book.selected;
                }

                id = this.books.findIndex(v => v.item_code === id);
                console.log(book.selected, id, this.books);
                console.log(this.books[id].selected);
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