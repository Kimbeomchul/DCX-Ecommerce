import Vue from 'vue'
import App from './App.vue'
// import ProductDetail from './components/ProductDetail.vue'

import router from './routes/router'
import * as filters from './util/filters'
import vuetify from './plugins/vuetify'

// vuejs-dialog
import VuejsDialog from 'vuejs-dialog'
import 'vuejs-dialog/dist/vuejs-dialog.min.css'
import Login from './components/Login'
import view from './constants/dialogCustomView'

Vue.config.productionTip = false

// 전역 filter 등록
for(const key in filters) {
  Vue.filter(key, filters[key]);
}

Vue.use(VuejsDialog,{
	backdropClose: true,
});

Vue.dialog.registerComponent(view.LOGIN, Login);

new Vue({
  el: '#app',
  vuetify,
  router,
  // render: h => h(ProductDetail)
  render: h => h(App)
});