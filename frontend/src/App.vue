<template>
<div id="app">
  <v-app id="inspire">
    <HeaderWrapper />
    <router-view></router-view>
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
      HeaderWrapper
    },
  }
</script>
