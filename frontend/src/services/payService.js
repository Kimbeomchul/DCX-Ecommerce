import apiService from '../api/apiService'
import api from '../constants/api'
import * as userService from './userService'
import * as utils from '../util/utils'
import * as bookService from './bookService'

export async function pay(books) {
    const params = {
        item_name: `${books[0].item_title} ${books.length > 1 ? (' 외 ' + (books.length - 1) + '건') : ''}`,
        item_cost: books.reduce((acc,cur) => acc + cur.item_price, 0)
    }
    
    console.log(params);
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
    const books = utils.getLocalstorageItem('buyItems');

    const params = {
        datas: books.map(v => v.item_code).join(','),
        member_id: userService.getUser('member_id'),
        pay_kakao: localStorage.getItem('tid'),
    }
    rewardSave();
    return await apiService.toPost(api.PAY_SAVE, params);
}

/**
 * 적립금 저장
 */
async function rewardSave() {
    const params = {
        member_savemoney: localStorage.getItem('rewards'),
        member_id: userService.getUser('member_id'),
    };
    return await apiService.toPut(api.REWARD_SAVE, params);
}

/**
 * 결제 내역 조회
 */
export async function getOrderList() {
    const params = {member_id: userService.getUser('member_id')};
    const orderInfos = await apiService.toGet(api.PAY_LIST, params);
    const payKakaoNoList = [...new Set(orderInfos.map(v => v.pay_kakao))];
    const books = await bookService.getBookList();
    
    const orderList = payKakaoNoList.map(v => {
        return {payKakao: v}
    });

    orderInfos.forEach(v => {
        const index = orderList.findIndex(w => w.payKakao === v.pay_kakao);
        const item = books.find(w => w.item_code === v.item_code);

        if(orderList[index]['items']) {
            orderList[index]['items'].push(item);
        } else {
            orderList[index]['items'] = [item];
        }
    })

    return orderList;
}