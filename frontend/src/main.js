import Vue from 'vue'
import App from './App.vue'
//import Test from './pages/Test.vue'
import router from './routes/router'
import * as filters from './util/filters'
import vuetify from './plugins/vuetify'
//import OrderPage from './components/OrderPage'

// vuejs-dialog
import VuejsDialog from 'vuejs-dialog'
import 'vuejs-dialog/dist/vuejs-dialog.min.css'
import Login from './components/Login'
import view from './constants/dialogCustomView'
import store from '@/store/index'
import SelectBooks from './components/SelectBooks'

Vue.config.productionTip = false

// 전역 filter 등록
for(const key in filters) {
  Vue.filter(key, filters[key]);
}

Vue.use(VuejsDialog,{
  backdropClose: true,
  html: true,
});

// 전역 store 등록

Vue.dialog.registerComponent(view.LOGIN, Login);
Vue.dialog.registerComponent(view.SELECT_BOOKS, SelectBooks);

new Vue({
  el: '#app',
  vuetify,
  router,
  store,
  //render: h => h(OrderPage)
  render: h => h(App)
  //render: h => h(Test)
});
