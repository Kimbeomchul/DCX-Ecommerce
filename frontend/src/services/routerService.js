import router from '../routes/router'

export function go(path, query, params) {
  router.push({path, query, params})
}

export function goback() {
  router.go(-1);
}