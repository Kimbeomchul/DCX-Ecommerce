import router from '../routes/router'

export function go(path, query) {
  router.push({path, query})
}

export function goback() {
  router.go(-1);
}