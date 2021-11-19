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
    }
}