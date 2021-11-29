import Vue from 'vue'

export function alert(message, options) {
  Vue.dialog.alert(message, options);
}

export function confirm(message, options) {
  return Vue.dialog.confirm(message, options)
        .then(data => data)
        .catch(data => data);
}

export async function alertCustomComponent(view) {
  return await Vue.dialog.confirm('로그인팝업 테스트', {
    view
  })
}