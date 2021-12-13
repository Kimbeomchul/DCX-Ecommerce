export default Object.freeze({
    // 로컬
    // BASE_URL: 'http://192.168.114.110/',
    // 클라우드 
    BASE_URL: 'http://3.36.39.51/',

    // 로그인
    // KAKAO_LOGIN_URL: 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0283e78b831185c25b7ed36ea030a098&redirect_uri=http://3.35.120.54:8080/',
    KAKAO_LOGIN_URL: 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0283e78b831185c25b7ed36ea030a098&redirect_uri=http://3.36.39.51/auth/kakao/callback',
    KAKAO_LOGOUT: 'kapi.kakao.com/v1/user/unlink',
    
    // 도서
    GET_BOOK_LIST: 'item/all',
    GET_BOOK_RANDOM: 'item/recc',
    GET_BOOK_BY_TITLE: 'item/title',
    GET_BOOK_BY_CODE: 'item/code',
    DELETE_BOOK: 'item/code',
    ADD_BOOK: 'item/code',
    RECOMMAND: 'http://3.36.39.51:5000/rec/',
    GET_RECOMMAND_BOOKS: 'recc/result',
    GET_CATEGORY: 'item/genre',

    // 장바구니
    GET_BASKET_LIST: 'basket/all',
    SEARCH_BASKET: 'basket/search',
    ADD_BASKET: 'basket/item',
    DELETE_BASKET: 'basket/item',
    DELETE_BASKET_LIST: 'basket/all',

    // 사용자
    GET_USER_LIST: 'users/all',
    SAVE_USER_INFO: 'users/info',

    // 찜
    GET_ZZIM_LIST: 'zzim/item',
    ADD_ZZIM: 'zzim/item',
    DELETE_ZZIM: 'zzim/item',
    COUNT_ZZIM: 'zzim/count',

    // 구매
    PAY: 'pay',
    PAY_LIST: 'pay/item',
    PAY_SAVE: 'pay/item',
    REWARD_SAVE: 'users/reward',
})