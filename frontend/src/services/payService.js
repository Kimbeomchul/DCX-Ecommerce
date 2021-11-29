import apiService from '../api/apiService'
import api from '../constants/api'

export async function pay() {
    const path = await apiService.toGet(api.PAY);
    
}