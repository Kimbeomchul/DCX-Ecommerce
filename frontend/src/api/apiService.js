import axios from "axios";
import api from '../constants/api' 

const instance = axios.create({
    baseURL: api.BASE_URL,
    timeout: 3000
});

function toRequest(method, url, params){
    const options = {method, url};

    if(method === 'GET') {
        options.params = params;
    } else {
        options.data = params;
    }

    return instance(options)
            .then(res => successHandler(res))
            .catch(res => errorHandler(res));
}

function successHandler(response) {
    return Promise.resolve(response.data);
}

function errorHandler(response) {
    return Promise.reject(response.data);
}


function toGet(url, params) {
    return toRequest('GET', url, params);
}

function toPost(url, params) {
    return toRequest('POST', url, params);
}

function toDelete(url, params) {
    return toRequest('DELETE', url, params);
}

export default {toGet, toPost, toDelete}