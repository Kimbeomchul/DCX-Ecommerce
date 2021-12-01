import apiService from "../api/apiService";
import api from '../constants/api'

import * as userService from './userService'
import * as bookService from './bookService'
/**
 * 장바구니 전체 조회
 * @returns {Array} basket
 */
export async function getBasketList() {
    return await apiService.toGet(api.GET_BASKET_LIST);
}

/**
 * 유저별 장바구니 조회
 * @returns {Array} basket
 */
export async function getBasket() {
    const member_id = userService.getUser('member_id');
    
    const basketList = await apiService.toGet(api.SEARCH_BASKET, {member_id});

    if(basketList.length > 0) {
        const itemCodes = basketList.map(v => v.item_code);
        return await bookService.getBookByCode(itemCodes);
    }
    return ;
}

/**
 * 장바구니 아이템 추가
 * @param {Number} itemCode
 * @param {String} userId
 */
export async function addBasket(itemCode) {
    const params = {
        item_code: itemCode,
        member_id: userService.getUser('member_id')
    };
    return await apiService.toPost(api.ADD_BASKET, params);
}

/**
 * 장바구니 아이템 삭제
 * @param {String} itemCode
 */
export async function deleteBasket(itemCode) {
    const params = {
        item_code: itemCode,
        member_id: userService.getUser('member_id')
    }
    return await apiService.toDelete(api.DELETE_BASKET, params);
}

/**
 *  장바구니 아이템 전체 삭제
 */
export async function deleteBasketList() {
    const params = {
        member_id: userService.getUser('member_id')
    }
    return await apiService.toDelete(api.DELETE_BASKET_LIST, params);
}