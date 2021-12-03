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

