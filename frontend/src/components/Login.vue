<template>
<div>
    <div>
        <v-card-title>로그인</v-card-title>
        <v-divider />
    </div>
    <div style="margin-top:20px">
        <button @click="kakaoLogin">
            <img src="@/assets/kakao_login_medium_narrow.png">
        </button>
    </div>
</div>
</template>

<script>
import vuejsDialogMixin from 'vuejs-dialog/dist/vuejs-dialog-mixin.min.js';
import api from '../constants/api'
export default {
    name: 'Login',
    mixins: [vuejsDialogMixin],
    data() {
        return {
            url: api.KAKAO_LOGIN_URL
        }
    },
    methods: {
        kakaoLogin() {
            location.href = api.KAKAO_LOGIN_URL;
        }
    }

}
</script>