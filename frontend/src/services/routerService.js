import router from '../routes/router'

export function go(path) {
  router.push(path)
}

export function goback() {
  router.go(-1);
}
