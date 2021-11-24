import Vue from 'vue'
import MyPage from './components/MyPage'
//import App from './App.vue'
//import ProductDetail from './components/ProductDetail.vue'

import router from './routes/router'
import * as filters from './util/filters'
import vuetify from './plugins/vuetify'

Vue.config.productionTip = false

// 전역 filter 등록
for(const key in filters) {
  Vue.filter(key, filters[key]);
}

new Vue({
  el: '#app',
  vuetify,
  router,
  render: h => h(MyPage)
  //render: h => h(ProductDetail)
  //render: h => h(App)
});
