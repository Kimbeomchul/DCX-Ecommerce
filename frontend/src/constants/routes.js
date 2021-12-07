export const ROUTES = Object.freeze({
    MAIN: '/',
    LOGIN: 'login',
    ADDPRODUCT: 'addProduct',
    CART: 'cart',
    MYPAGE: 'mypage',
    ZZIM: 'zzim',
    TEST: 'test',
    ORDEREDLIST: 'orderedList',
    ORDER: 'order',
    PRODUCT_DETAIL: 'productDetail'
});

export const LOGIN_NEED = [
    ROUTES.ADDPRODUCT,
    ROUTES.CART,
    ROUTES.MYPAGE,
    ROUTES.ZZIM,
    ROUTES.ORDEREDLIST,
    ROUTES.ORDER
]

export const CAN_GO_BACK_NAME = [
    ROUTES.MYPAGE,
    ROUTES.ORDER,
    ROUTES.ORDEREDLIST,
    ROUTES.TEST,
    ROUTES.ZZIM,
    ROUTES.CART,
    ROUTES.PRODUCT_DETAIL
]