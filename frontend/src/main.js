import Vue from 'vue'
import App from './App.vue'

import router from './routes/router'
import * as filters from './util/filters'

Vue.config.productionTip = false

// 전역 filter 등록
for(const key in filters) {
  Vue.filter(key, filters[key]);
}

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
