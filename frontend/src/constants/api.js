export default Object.freeze({
    // 로컬
    // BASE_URL: 'http://192.168.114.110/',
    // 클라우드 
    BASE_URL: 'http://3.36.39.51/',

    // 로그인
    // KAKAO_LOGIN_URL: 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0283e78b831185c25b7ed36ea030a098&redirect_uri=http://3.35.120.54:8080/',
    KAKAO_LOGIN_URL: 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0283e78b831185c25b7ed36ea030a098&redirect_uri=http://3.36.39.51/auth/kakao/callback',
    KAKAO_LOGOUT: 'kapi.kakao.com//v1/user/unlink',
    
    // 도서
    GET_BOOK_LIST: 'allitem',
    GET_BOOK_RANDOM: 'selectitem',
    GET_BOOK_BY_TITLE: 'searchid',
    GET_BOOK_BY_CODE: 'getItemCode',
    DELETE_BOOK: 'ditem',
    ADD_BOOK: 'aitem',
    RECOMMAND: 'rec',

    // 장바구니
    GET_BASKET_LIST: 'allbasket',
    SEARCH_BASKET: 'searchbasket',
    ADD_BASKET: 'abasket',
    DELETE_BASKET: 'dbasket',
    DELETE_BASKET_LIST: 'dabasket',

    // 사용자
    GET_USER_LIST: 'user',

    // 찜
    GET_ZZIM_LIST: 'allzzim',
    ADD_ZZIM: 'azzim',
    DELETE_ZZIM: 'dzzim',

    // 구매
    PAY: 'pay',
    PAY_SAVE: 'paysave',
    GET_PAY_LIST: 'paylist',
})