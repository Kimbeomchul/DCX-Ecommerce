<template>
<div id="app">
  <v-app id="inspire">
    <v-card>
      <v-app-bar
        absolute
        color="white"
        elevate-on-scroll
        scroll-target="#scrolling-techniques-7"
      >
        <v-toolbar-title>Title</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn icon>
          <v-icon>person</v-icon>
        </v-btn>
        <v-btn icon>
          <v-icon>shopping_bag</v-icon>
        </v-btn>
      </v-app-bar>
    </v-card>

    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="700"
    >
      <v-container fluid style="padding-top:60px;">
        <h1 class="font-weight-black">
          인기 많은 책
        </h1>
        <v-row>
          <v-col>
            <v-card
              class="pa-2"
              outlined
            >
              <div>1위</div>
              <v-img
                :src="ranked.src"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
              >
              </v-img>
              <v-card-title v-text="ranked.title"></v-card-title>
            </v-card>
          </v-col>
          <v-col>
            <v-card
              class="pa-2"
              outlined
              tile
            >
              <div>2위</div>
              <v-img
                :src="ranked.src"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
              >
              </v-img>
              <v-card-title v-text="ranked.title"></v-card-title>
            </v-card>
          </v-col>
          <v-col>
            <v-card
              class="pa-2"
              outlined
              tile
            >
              <div>3위</div>
              <v-img
                :src="ranked.src"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
              >
              </v-img>
              <v-card-title v-text="ranked.title"></v-card-title>
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
            v-for="book in books"
            :key="book.title"
            :cols="book.flex"
          >
            <v-card>
              <v-img
                :src="book.src"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
              >
                <v-btn icon>
                  <v-icon>mdi-heart</v-icon>
                </v-btn>
              </v-img>
              <v-card-title v-text="book.title"></v-card-title>
              <v-card-text v-text="book.price"></v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn icon>
                  <v-icon>mdi-heart</v-icon>
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-sheet>
    
  </v-app>
</div>
</template>

<style lang="scss" scoped>
  .test {
    position: relative;
  }

  .like-button {    
    position:absolute;
    width:100%;
  }

</style>

<script>
export default {
    data: () => ({
      books: [
        { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', price: '10,000 원', flex: 6 },
        { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
        { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', price: '10,000 원', flex: 6 },
        { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
      ],
      ranked: [
        { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg'},
        { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg'},
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg'},
      ],
      categories: [
        { name: '소설' },
        { name: '시' },
        { name: '인문학' },
        { name: '종교' },
      ]
    }),
  }
</script>
