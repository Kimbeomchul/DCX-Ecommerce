<template>
  <v-dialog v-model="dialog">
    <div>
      <h2 style="text-align:center; font-family:monospace; background-color: cadetblue; margin-bottom: 5px">
        선호 도서 선택 ({{count}}/5)
      </h2>
    </div>
    <v-row>
      <v-col
        v-for="(book,index) in books"
        :key="book.item_code"
        class="d-flex child-flex"
        cols="4"
      >

      <v-hover v-slot="{ hover }">
        <v-card :class="{ 'on-hover': hover }">
          <div :style="{'height':'10px', 'background-color': book.selected ? 'darkcyan': 'white'}">
          </div>
          <v-img
            :key="index"
            :src="book.item_image"
            aspect-ratio="1"
            class="grey lighten-2"
            @click="select(book)"
          >
          <v-alert
            color="#2A3B4D"
            dark
            dense
          >
            <div style="font-size: 10px">
              [{{book.item_section}}]
            </div>
            <div>
              {{book.item_title}}
            </div>
          </v-alert>
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

        </v-card>
      </v-hover>
      </v-col>
    </v-row>
  </v-dialog>
</template>

<script>
import * as bookService from '../services/bookService';
import * as userService from '../services/userService'

export default {
  name: 'SelectBooks',
  data() {
      return {
          limit: 5,
          books: [],
          dialog: true,
          user: {},
          clicked: false,
          count: 0,
      }
  },
  methods: {
    async select(book) {
      book.selected = !book.selected;

      const selectedBooks = this.books.filter(v => v.selected);
      this.count = selectedBooks.length;

      if(this.count >= this.limit) {
        await bookService.sendWantBooks(selectedBooks);
        this.user.need_book_reccomand = false;
        userService.setUser(this.user);
        this.$emit('closed');
        this.dialog = false;
      }
    }
  },
  async created() {
    this.user = userService.getUser();

      this.books = await bookService.getBookRandom();
    if(this.user && this.user.need_book_reccomand) {
      this.dialog = true
    }
  }
}
</script>

<style scoped>
>>> .v-dialog {
  background-color:ghostwhite;
  overflow-y: hidden;
}

.v-card {
transition: opacity .4s ease-in-out;
opacity: 0.6;
}

.v-card.on-hover {
opacity: 1;
}

.show-btns {
color: rgba(255, 255, 255, 1);
display: hidden;
}
.show-btns:hover {
color: black;
display: block;
}
</style>
