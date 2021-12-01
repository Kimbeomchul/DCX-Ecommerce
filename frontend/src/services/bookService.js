import apiService from "../api/apiService";
import api from '../constants/api'
import * as utils from '../util/utils'
import * as userService from './userService'

/**
 * 도서 전체 조회
 * @returns {Array} book
 */
export async function getBookList() {
    return await apiService.toGet(api.GET_BOOK_LIST);
}

/**
 * 도서 9개 랜덤 조회
 * @returns {Object} book
 */
export async function getBookRandom() {
    return await apiService.toGet(api.GET_BOOK_RANDOM);
}

/**
 * 도서 리스트 조회
 * @param {string} itemcode,itemcode,... ex) 1,2,3
 * @returns {Object} book
 */
export async function getBookByCode(item_codes) {
    return await apiService.toGet(api.GET_BOOK_BY_CODE, {data: item_codes.toString()});
}

/**
 * 도서 타이틀로 조회
 * @param {String} itemTitle
 * @returns {Object} book
 */
export async function getBookByTitle(itemTitle) {
    const params = {};
    params['item_title'] = itemTitle;
    return await apiService.toGet(api.GET_BOOK, params);
}

/**
 * 도서 추가
 * @param {Object} book
 */
export async function registerBook(book) {
    const params = utils.cameltoSnake(book);
    params['item_date'] = utils.nowDate();
    return await apiService.toPost(api.ADD_BOOK, params);
}

/**
 * 사용자 희망 도서 선택
 * @param {Array} book
 */
export async function removeBook(itemCode) {
    const params = {
        item_code: itemCode,
        member_id: userService.getUser('member_id')
    };
    return await apiService.toDelete(api.RECOMMAND, params);
}
