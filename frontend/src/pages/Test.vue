<template>
    <div style="align-self:center; margin:30px">
        <div style="margin-top: 100px">
            <v-divider />
            <p>apiTest</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="apiTest">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>userSet</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="userSet">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>userClear</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="userClear">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>Filter Test</p>
            <p>{{money | currency | won}}</p>
        </div>
        <div>
            <v-divider />
            <p>Router Test</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="routerTest">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>Login Test</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="loginTest">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>Image Test</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="imageTest">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>Pay Test</p>
            <v-btn style="margin-bottom: 30px" color="primary" v-on:click="payTest">testClick</v-btn>
        </div>
        <div>
            <v-divider />
            <p>Pay Test</p>
            <!-- <v-text-field type="number" v-model="dd"></v-text-field> -->
            <input v-model="dd">
        </div>
    </div>
</template>

<script>
import * as bookService from '../services/bookService'
import * as userService from '../services/userService'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'
import * as payService from '../services/payService'
import {ROUTES} from '../constants/routes'

export default {
    name: 'Main',
    data: () => {
        return {
        money: 100000,
        dd: 1
        }
    },
    watch: {
        dd(f,a) {
            console.log(this.dd, f,a);
            if(this.dd > 1000) {
                this.dd = 1000;
            }
        }
    },
    methods: {
        routerTest() {
            const query = {
                data:'success',
                status:'N',
                image:'http%3A%2F%2Fk.kakaocdn.net%2Fdn%2Fckwk6a%2FbtrlKfIWNBE%2FyheCY2RQVaMT57gJvrrkK1%2Fimg_640x640.jpg',
                nickname:'전주환',
                id:2007473952
            };
            // const query = {
            //     status:'N',
            //     image:'http%3A%2F%2Fk.kakaocdn.net%2Fdn%2Fckwk6a%2FbtrlKfIWNBE%2FyheCY2RQVaMT57gJvrrkK1%2Fimg_640x640.jpg',
            //     nickname:'전주환',
            //     id:2007473952
            // };
            routerService.go(ROUTES.MAIN, query);
        },
        payTest() {
            payService.pay();
        },
        imageTest() {
            // await dialogService.alertCustomComponent('SelectBooks');
            dialogService.confirm('결제가 완료되었습니다.<br>결제 페이지로 이동하시겠습니까?', () => {
                routerService.go('/mypage')
            });
        },
        async loginTest() {
            let test = await dialogService.alertCustomComponent('login');
            console.log(test);
        },
        apiTest: async () => {
            let test = await bookService.getBookList();
            console.log(test);
        },
        userSet: () => {
            const user = {
                need_book_reccomand: false,
                member_image:'http://k.kakaocdn.net/dn/ckwk6a/btrlKfIWNBE/yheCY2RQVaMT57gJvrrkK1/img_640x640.jpg',
                member_name:'전주환',
                member_id: 'mickey1102'
            };
            console.log('user info before:',  JSON.parse(localStorage.getItem('user')));
            localStorage.setItem('user', JSON.stringify(user));
            let test = JSON.parse(localStorage.getItem('user'));
            userService.setUser(test);
            console.log('user info after:',  JSON.parse(localStorage.getItem('user')));
        },
        userClear: () => {
            userService.clearUser()
        },
    },
}
</script>
