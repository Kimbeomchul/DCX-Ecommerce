/**
 * @param 1000 
 * @returns 1000원
 */
export function won(data) {
    return `${data} 원`
}

/**
 * @param 10000 
 * @returns 10,000
 */
export function currency(data) {
    return data ? data.toLocaleString() : 0;
}

/**
 * @param 함께여서 다해이야 메롱 
 * @returns 함께여서 다행..
 */
export function limitName(data, limit) {
    if(data !== data.toUpperCase()) {
        limit *= 2;
    }

    if(data.length > limit) {
        return data.slice(0, limit) + '..';
    }
    return data;
}
