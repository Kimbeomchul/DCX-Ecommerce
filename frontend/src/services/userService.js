import apiService from "../api/apiService";
import api from '../constants/api'
import * as utils from '../util/utils'

// 사용자 정보 전역변수로 사용
// getter setter를 이용해 접근
let user = undefined;

/**
 * 사용자 전체 조회
 * @returns {Array} user
 */
export async function getUserList() {
    return await apiService.toGet(api.GET_USER_LIST);
}

/**
 * 사용자 정보 저장
 */
export async function saveUserInfo(address, phoneNumber) {
    const params = {
        member_id: getUser('member_id'),
        member_phone: phoneNumber,
        member_address: address
    }
    return await apiService.toPut(api.SAVE_USER_INFO, params);
}

/**
 * 사용자 조회
 */
export function getUser(key) {
    if(user) {
        return key ? user[key] : user;
    }
    
    user = utils.getLocalstorageItem('user');
    return key ? user[key] : user;
}

/**
 * 사용자 정보를 로컬스토리지에 저장
 */
export function setUser(data) {
    user = data;
    localStorage.setItem('user', JSON.stringify(data));
}

export function clearUser() {
    localStorage.removeItem('user');
    user = undefined;
}