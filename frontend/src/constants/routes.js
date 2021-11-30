export const ROUTES = Object.freeze({
    MAIN: '/',
    LOGIN: '/login',
    ADDPRODUCT: '/addProduct',
    CART: '/cart',
    MYPAGE: '/mypage',
    ZZIM: '/zzim',
    TEST: '/test',
    ORDEREDLIST: '/orderedList',
    ORDER: '/order'
});

export const LOGIN_NEED = [
    ROUTES.ADDPRODUCT,
    ROUTES.CART,
    ROUTES.MYPAGE,
    ROUTES.ZZIM,
    ROUTES.ORDEREDLIST
]