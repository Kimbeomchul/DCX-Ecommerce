import axios from "axios";
import api from '../constants/api'
import {ROUTES} from '../constants/routes'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'

const instance = axios.create({
    baseURL: api.BASE_URL,
    timeout: 3000
});

function toRequest(method, url, params, errorAlert){
    return instance({method, url, params})
            .then(res => successHandler(res, errorAlert))
            .catch(res => errorHandler(res, errorAlert));
}

function successHandler(response) {
    return Promise.resolve(response.data);
}

function errorHandler(response, errorAlert = true) {
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

    if(errorAlert) {
        dialogService.alert(errorMessage);
    }
    
    return Promise.reject(response.data);
}


function toGet(url, params, errorAlert) {
    return toRequest('GET', url, params, errorAlert);
}

function toPost(url, params, errorAlert) {
    return toRequest('POST', url, params, errorAlert);
}

function toDelete(url, params, errorAlert) {
    return toRequest('DELETE', url, params, errorAlert);
}

export default {toGet, toPost, toDelete}
