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
    </div>
</template>

<script>
import * as bookService from '../services/bookService'
import * as userService from '../services/userService'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'
import {ROUTES} from '../constants/routes'
import * as testService from '../services/testService'

export default {
    name: 'Main',
    data: () => {
        return {
        money: 100000,
        }
    },
    methods: {
    routerTest() {
        const query = {
            status:'N',
            image:'http%3A%2F%2Fk.kakaocdn.net%2Fdn%2Fckwk6a%2FbtrlKfIWNBE%2FyheCY2RQVaMT57gJvrrkK1%2Fimg_640x640.jpg',
            nickname:'전주환',
            id:2007473952
        };
        routerService.go(ROUTES.MAIN, query);
    },
    payTest() {
        testService.gettest();
    },
    async imageTest() {
        await dialogService.alertCustomComponent('SelectBooks');
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
        console.log('user info before:',  JSON.parse(localStorage.getItem('user')));
        let obj = {name:'joohwan', year:30};
        localStorage.setItem('user', JSON.stringify(obj));
        let test = JSON.parse(localStorage.getItem('user'));
        userService.setUser(test);
        console.log('user info after:',  JSON.parse(localStorage.getItem('user')));
    },
    userClear: () => {
        localStorage.removeItem('user');
    },
  },
}
</script>