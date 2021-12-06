import apiService from "../api/apiService";
import api from '../constants/api'
import * as utils from '../util/utils'
import * as userService from './userService'
import axios from "axios";

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
    const books =  await apiService.toGet(api.GET_BOOK_RANDOM);
    return books.filter((v,i) => i < 9);
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
    return await apiService.toGet(api.GET_BOOK_BY_TITLE, params);
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
 * 도서 삭제
 * @param {Array} book
 */
export async function removeBook(itemCode) {
    const params = {
        item_code: itemCode,
        member_id: userService.getUser('member_id')
    };
    return await apiService.toDelete(api.RECOMMAND, params);
}

/**
 * 도서 카테고리 조회
 * @returns {Array} category
 */
 export async function getCategoryList() {
    return await apiService.toGet(api.GET_CATEGORY);
}

/**
 * 추천 도서 조회
 */
 export async function sendWantBooks(books) {
    let arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    const categories = ['소설' , '에세이' , '칼럼' , '미술' , '건강' , '취미' , '어린이' , '고전', '과학' , '만화'];
    
    books.forEach(v => {
        const index = categories.indexOf(v.item_section);
        arr[index]++;
    })

    const userId = userService.getUser('member_id');
    const params = `${arr.join('')}/${userId}`;

     return axios.get(api.RECOMMAND + params);
    }
    
    export async function getRecommandBooks() {
        const params = {
            member_id: userService.getUser('member_id')
        };
    return await apiService.toGet(api.GET_RECOMMAND_BOOKS, params);
}