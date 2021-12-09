<template>
  <div class="empty">
    <v-icon size="400%">{{iconName}}</v-icon>
    <div>{{message}}</div>
  </div>
</template>

<style scoped>
  .empty {
    position: absolute;
    top: 40%;
    text-align: center;
    width: 100%;
    font-weight: bold;
  }
</style>

<script>
export default {
    components: {
    },
    props: ['iconName', 'message'],
    data: () => ({
      // books: store.state.books
    }),
    methods: {
    },
    created() {
    }
  }
</script>