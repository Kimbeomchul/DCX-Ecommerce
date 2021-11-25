<template>
<div id="app">
  <v-app id="inspire">
    <MainWrapper />
  </v-app>
</div>
</template>

<script>
import MainWrapper from "@/pages/Main";

export default {
  name: 'App',
  components: {
    MainWrapper,
  },
}
</script>
