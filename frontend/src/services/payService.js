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
 * 
 * @returns 결제내역
 */
export async function payList() {
    const user = userService.getUser();
    return await apiService.toGet(api.GET_PAY_LIST, user);
}