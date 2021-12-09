<template>
  <v-dialog v-model="dialog" persistent>
    <div class="select-title">
      <h2 class="inline">
        선호 도서 선택 ({{count}}/5)
      </h2>
      <v-button style="margin-left:10px" @click="getBookRandom">
        <v-icon>refresh</v-icon>
      </v-button>
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
          <div :style="{'height':'10px', 'background-color': book.selected ? 'lightcoral': 'white'}">
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
import * as routerService from '../services/routerService'

export default {
  name: 'SelectBooks',
  data() {
      return {
          limit: 5,
          books: [],
          dialog: false,
          user: {},
          clicked: false,
          count: 0,
      }
  },
  methods: {
    async getBookRandom() {
      this.books = await bookService.getBookRandom();
      this.count = 0;
    },
    async select(book) {
      book.selected = !book.selected;

      const selectedBooks = this.books.filter(v => v.selected);
      this.count = selectedBooks.length;

      if(this.count >= this.limit) {
        await bookService.sendWantBooks(selectedBooks);
        this.user.need_book_reccomand = false;
        userService.setUser(this.user);
        this.$emit('closed');
        routerService.go('/',{})
        this.dialog = false;
      }
    }
  },
  async created() {
    this.user = userService.getUser();
    await this.getBookRandom();

    if(this.user && this.user.need_book_reccomand) {
      this.dialog = true
    }
  }
}
</script>

<style scoped>
.select-title {
text-align:center; 
font-family:monospace; 
background-color: cornflowerblue; 
margin-bottom: 5px;
}

.select-title .inline {
  display: inline-block;
}

>>> .v-dialog {
  background-color:ghostwhite;
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
