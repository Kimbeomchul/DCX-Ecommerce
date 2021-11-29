import axios from "axios";
import api from '../constants/api' 
import {ROUTES} from '../constants/routes'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'

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
    let errorMessage = '';
    const defaultErrorMessage = '서버와의 통신이 원활하지 않습니다. 잠시 후 다시 시도 해주세요';

    switch (response.status) {
        case 401:
            errorMessage = '권한이 없습니다. 다시 로그인해주세요';
            routerService.go(ROUTES.MAIN);
            break;

        default:
            errorMessage = response.message ? response.message : defaultErrorMessage;
    }
    dialogService.alert(errorMessage);
    
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