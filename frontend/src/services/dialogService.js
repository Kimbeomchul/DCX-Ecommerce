import Vue from 'vue'
import view from '../constants/dialogCustomView'

export function alert(message, options) {
  Vue.dialog.alert(message, options);
}

export function confirm(message, options) {
  return Vue.dialog.confirm(message, options)
        .then(data => data)
        .catch(data => data);
}

export function alertCustomComponent() {
  Vue.dialog.confirm('로그인팝업 테스트', {
    view: view.LOGIN,
  })
}