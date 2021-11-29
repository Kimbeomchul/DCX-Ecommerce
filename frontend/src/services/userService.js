import apiService from "../api/apiService";
import api from '../constants/api'

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
 * 사용자 조회
 * @returns {Object} user
 */
export function getUser() {
    if(user) {
        return user;
    }
    
    user = JSON.parse(localStorage.getItem('user'));
    return user;
}

/**
 * 사용자 정보를 로컬스토리지에 저장
 * @param {Object} data 
 */
export function setUser(data) {
    user = localStorage.setItem('user', JSON.stringify(data));
}
