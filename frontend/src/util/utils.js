// const week = ['일', '월', '화', '수', '목', '금', '토'];

const today = new Date();
const year = today.getFullYear();
const month = today.getMonth();
const date = today.getDate();
// const day = week[today.getDay()];

/**
 * 오늘 날짜
 * @returns YYYY-MM-DD
 */
export function nowDate() {
    return `${year}-${month}-${date}`;
}


/**
 * Calmelcase To Snakecase
 */
export function cameltoSnake(calmelObject) {
    let snakeObject = {};

    for(const calmelKey in calmelObject) {
        let snakeKey = calmelKey.split('').map(v => {
            if(v === v.toUpperCase()) {
                return '_' + v.toLowerCase();
            }
            return v;
        }).join('');

        snakeObject[snakeKey] = calmelObject[calmelKey];
        return snakeObject;
    }
}

/**
 * Object가 비었는지 확인
 * @returns {boolean}
 */
export function isEmptyObject(object) {
    if(object) {
        return Object.keys(object).length === 0;
    }
    return false;
}

/**
 * 로컬스토리지 데이터 조회
 */
export function getLocalstorageItem(dataName, key) {
    let data = JSON.parse(localStorage.getItem(dataName));
    return key ? data[key] : data;
}

/**
 * 로컬스토리지 데이터 저장
 */
export function setLocalstorageItem(dataName, data) {
    localStorage.setItem(dataName, JSON.stringify(data));
}

/**
 * 로컬스토리지 데이터 삭제
 */
export function clearLocalsorageItem(dataName) {
    localStorage.removeItem(dataName);
}