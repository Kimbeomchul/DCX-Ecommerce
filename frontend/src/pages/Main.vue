<template>
<div id="app">
  <v-app id="inspire">
    <HeaderWrapper />
    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
    <router-view></router-view>
    </v-sheet>

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
import HeaderWrapper from "@/components/Header";

export default {
    components: {
      HeaderWrapper,
    },
    data: () => ({
      books: [
        { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', price: '10,000 원', flex: 6 },
        { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines2', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
        { title: 'Pre-fab homes2', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', price: '10,000 원', flex: 6 },
        { title: 'Favorite road trips2', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines3', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
        { title: 'Best airlines4', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', price: '10,000 원', flex: 6 },
      ],
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
}
</script>