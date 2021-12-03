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
import OrderPage from '../components/OrderPage'

import * as userService from '../services/userService'
import {LOGIN_NEED, ROUTES} from '../constants/routes'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'
import * as payService from '../services/payService'
import view from '../constants/dialogCustomView'
import * as utils from '../util/utils'

Vue.use(VueRouter);

//라우트 정보
const routes = [
    {
        path: '/',
        name: '/',
        component: Main
    }
    ,{
        path: '/login',
        name: 'login',
        component: Login
    },
    {
        path: '/addProduct',
        name: 'addProduct',
        component: AddProductPage
    },
    {
        path: '/cart',
        name: 'cart',
        component: CartPage
    },
    {
        path: '/mypage',
        name: 'mypage',
        component: MyPage
    },
    {
        path: '/zzim',
        name: 'zzim',
        component: Zzim
    }
    ,{
        path: '/test',
        name: 'test',
        component: Test
    },
    {
        path: '/orderedList',
        name: 'orderedList',
        component: OrderedList
    },
    {
        path: '/book/:bookTitle',
        component: ProductDetail,
    },
    {
        path: '/order',
        name: 'order',
        component: OrderPage
    },
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
router.beforeEach(async (to, from, next) => {
    if(to.path === '/' && !utils.isEmptyObject(to.query)) {
        const query = to.query;
        
        if(query.data) {
            let message = '';
            let successHandler;
            switch(query.data) {
                case 'success': 
                    await payService.paySave();
                    message = '결제가 완료되었습니다.<br>결제 페이지로 이동하시겠습니까?';
                    successHandler = () => {
                        routerService.go(ROUTES.ORDEREDLIST);
                    }
                    dialogService.confirm(message, successHandler);
                    break;
                case 'fail':
                    message = '결제 실패하였습니다.';
                    dialogService.alert(message);
                    break;
                case 'cancel':
                    message = '결제를 취소하였습니다.';
                    dialogService.alert(message);
                    break;
            }
        } else {
            userService.setUser({
                member_id: query.id,
                member_image: query.image,
                mbmber_name: query.nickName,
                need_book_reccomand: !query.status
            });
        }
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
