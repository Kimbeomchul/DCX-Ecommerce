import Vue from "vue";
import VueRouter from "vue-router";

import Login from '../components/Login';
import Main from '../components/MainPage';
import AddProductPage from '../components/AddProductPage';
import MyPage from '../components/MyPage';
import CartPage from '../components/CartPage';
import Zzim from '../components/ZzimList';
import Test from '../pages/Test'

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
    },
    {
        path: '/addProduct',
        component: AddProductPage
    },
    {
        path: '/cart',
        component: CartPage
    },
    {
        path: '/mypage',
        component: MyPage
    },
    {
        path: '/zzim',
        component: Zzim
    }
    ,{
        path: '/test',
        component: Test
    }
]

//라우터 생성
const router = new VueRouter({
    mode: 'history',
    routes
})

export default router;