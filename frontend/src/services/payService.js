import apiService from '../api/apiService'
import api from '../constants/api'
import * as userService from './userService'
import * as bookService from '../services/bookService'


export async function pay(books) {
    books = Object.values(books);
    const params = {
        item_name: `${books[0].item_title}외 ${books.length}건`,
        item_cost: books.reduce((acc,cur) => acc + cur.item_price, 0)
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
export async function paySave() {
    const params = {
        datas: bookService.getBuyingBooks().map(v => v.item_code).join(','),
        member_id: userService.getUser('member_id'),
        pay_kakao: localStorage.getItem('tid')
    }
    return await apiService.toPost(api.PAY_SAVE, params);
}