<template>
  <v-dialog v-model="dialog" width="500px" >
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
import * as userService from '../services/userService'

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
  watch: {
    dialog(newData) {
      console.log('watch newData: ', newData);
    }
  },
  methods: {
    async select(book) {
      book.selected = !book.selected;

      const selectedBooks = this.books.filter(v => v.selected);

      if(selectedBooks.length >= this.limit) {
        await bookService.sendWantBooks(selectedBooks);
        const user = userService.getUser();
        user.need_book_reccomand = false;
        userService.setUser(user);
        this.$emit('closed');
        this.dialog = false;
      }
    }
  },
  async created() {
    this.dialog = this.data;
    this.books = await bookService.getBookRandom();
  }
}
</script>

<style scoped>
.selected {
opacity: 0.5
}
</style>