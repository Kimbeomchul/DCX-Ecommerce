import apiService from "../api/apiService";
import api from '../constants/api'
import * as utils from '../util/utils'

/**
 * 도서 전체 조회
 * @returns {Array} book
 */
export async function getBookList() {
    return await apiService.toGet(api.GET_BOOK_LIST);
}

/**
 * 도서 조회
 * @param {Number} itemCode
 * @returns {Object} book
 */
export async function getBook(itemCode) {
    return await apiService.toGet(api.GET_BOOK, itemCode);
}

/**
 * 도서 추가
 * @param {Object} book
 */
export async function registerBook(book) {
    const params = utils.cameltoSnake(book);
    params[item_date] = utils.nowDate();
    return await apiService.toPost(api.ADD_BOOK, params);
}

/**
 * 도서 삭제
 * @param {Number} itemCode
 */
export async function removeBook(itemCode) {
    const params = {item_code: itemCode};
    return await apiService.toDelete(api.DELETE_BOOK, params);
}

