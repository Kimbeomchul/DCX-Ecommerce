import apiService from '../api/apiService'
import api from '../constants/api'
import * as userService from './userService'

export async function pay() {
    const params = {
        item_name: '루시 외 5건',
        item_cost: '50000'
    }
    const response = await apiService.toGet(api.PAY, params);
    const [tid, path] = response.split(',');
    
    localStorage.setItem('tid', tid);
    window.location = path;
}

/**
 * 결제내역 조회
 * @param userId
 */
export async function payList() {
    const user = userService.getUser('member_id');
    return await apiService.toGet(api.GET_PAY_LIST, user);
}

/**
 * 결제 저장
 * @param userId
 */
export async function paySave(itemCodes) {
    const params = {
        nodap: itemCodes.join(','),
        member_id: userService.getUser('member_id'),
        pay_kakao: localStorage.getItem('tid')
    }
    return await apiService.toPost(api.PAY_SAVE, params);
}