import apiService from "../api/apiService";
import api from '../constants/api'

import * as userService from './userService'

/**
 * 찜목록 조회
 * @returns {Array} basket
 */
export async function getZzimList() {
    return await apiService.toGet(api.GET_ZZIM_LIST, userService.getUser('member_id'));
}

/**
 * 찜목록 아이템 추가
 * @param {Number} itemCode
 * @param {String} userId
 */
export async function addZzim(itemCode) {
    const params = {
        item_code: itemCode,
        member_id: userService.getUser('member_id')
    };
    return await apiService.toPost(api.ADD_ZZIM, params);
}

/**
 * 장바구니 아이템 삭제
 * @param {String} itemCode
 */
export async function deleteZzim(itemCode) {
    const params = {
        item_code: itemCode,
        member_id: userService.getUser('member_id')
    };
    return await apiService.toDelete(api.DELETE_ZZIM, params);
}