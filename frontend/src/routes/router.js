import Vue from "vue";
import VueRouter from "vue-router";

import Login from '../components/Login';
<<<<<<< HEAD
import Main from '../components/MainPage';
import AddProductPage from '../components/AddProductPage';
import MyPage from '../components/MyPage';
import CartPage from '../components/CartPage';
import Zzim from '../components/ZzimList';
=======
import Main from '../pages/Main';
import Test from '../pages/Test'
>>>>>>> 3b44b890a6ad9e93278c937d87c6707d65bc891e

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