import Vue from "vue";
import VueRouter from "vue-router";

import Login from '../components/Login';
import Main from '../pages/Main';

Vue.use(VueRouter);

//라우트 정보
const routes = [
    {
        path: '/',
        component: Main
    }
    ,{
        path: '/login',
        component: Login
    }
]


//라우터 생성
const router = new VueRouter({
    mode: 'history',
    routes
})

export default router;