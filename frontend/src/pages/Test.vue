<template>
    <div style="align-self:center; margin:30px">
        <div>
            <p>apiTest</p>
            <button v-on:click="apiTest">testClick</button>
        </div>
        <div>
            <p>userSet</p>
            <button v-on:click="userSet">testClick</button>
        </div>
        <div>
            <p>Filter Test</p>
            <p>{{money | currency | won}}</p>
        </div>
        <div>
            <p>Router Test</p>
            <button v-on:click="routerTest">testClick</button>
        </div>
        <div>
            <p>Dialog Test</p>
            <button v-on:click="dialogTest">testClick</button>
        </div>
    </div>
</template>

<script>
import * as bookService from '../services/bookService'
import * as userService from '../services/userService'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'
import routes from '../constants/routes'

export default {
    name: 'Main',
    data: () => {
        return {
        money: 100000,
        }
    },
    methods: {
    routerTest() {
        routerService.go(routes.MAIN);
    },
    async dialogTest() {
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
  },
}
</script>