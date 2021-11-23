import Vue from 'vue'
//import App from './App.vue'
import ProductDetail from './components/ProductDetail.vue'

Vue.config.productionTip = false

import vuetify from './plugins/vuetify'

new Vue({
  el: '#app',
  vuetify,
  render: h => h(ProductDetail)
  //render: h => h(App)
});
