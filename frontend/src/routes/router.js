import Vue from "vue";
import VueRouter from "vue-router";
import Login from '../components/Login';
import Main from '../components/MainPage';
import AddProductPage from '../components/AddProductPage';
import MyPage from '../components/MyPage';
import CartPage from '../components/CartPage';
import Zzim from '../components/ZzimList';
import Test from '../pages/Test';
import OrderedList from '../components/OrderedList';
import ProductDetail from '../components/ProductDetail';

import * as userService from '../services/userService'
import {LOGIN_NEED} from '../constants/routes'
import * as dialogService from '../services/dialogService'
import view from '../constants/dialogCustomView'
import * as utils from '../util/utils'


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
    },
    {
        path: '/orderedList',
        component: OrderedList
    },
    {
        path: '/book/:bookId',
        component: ProductDetail
    }
]

//라우터 생성
const router = new VueRouter({
    mode: 'history',
    routes
})

// 네비게이션 가드
// 1. 로그인 성공 시, 정보 저장
// 2. 로그인 필요한 페이지 진입 시, 로그인 여부 확인
// 2.1 기 로그인 시, 계속 진행
// 2.2 비 로그인 시, 로그인 팝업 및 페이지 진입 실패
router.beforeEach((to, from, next) => {
    if(to.path === '/' && !utils.isEmptyObject(to.query)) {
        console.log(to);
        const loginInfo = to.query;
        userService.setUser(loginInfo);
    }

    if(LOGIN_NEED.includes(to.path)) {
        const user = userService.getUser();
        if(!user) {
            dialogService.alertCustomComponent(view.LOGIN);
            return next(false);
        }
    }

    return next();
})

export default router;
