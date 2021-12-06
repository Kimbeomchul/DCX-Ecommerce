<template>
  <v-dialog v-model="dialog" width="500px" persistent>
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
  </v-dialog>
</template>

<script>
import * as bookService from '../services/bookService';
export default {
  name: 'SelectBooks',
  props: ["data"],
  data() {
      return {
          limit: 1,
          books: [],
          dialog: false,
      }
  },
  methods: {
    async select(book) {
      book.selected = !book.selected;

      const selectedBooks = this.books.filter(v => v.selected);

      if(selectedBooks.length >= this.limit) {
        await bookService.sendWantBooks(selectedBooks);
        this.$emit('closed');
        this.dialog = false;
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