import Vue from 'vue';
import Vuex from 'vuex';
import { getBookList } from '../services/bookService';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
      books: [],
    },
    mutations: {
      setBookList(state, bookList) {
        state.books = bookList;
      }
    },
    actions: {
    async FETCH_BOOKS(context) {
        await getBookList()
            .then(response => {
            console.log(response);
            context.commit('setBookList', response);
        })
    },
    }
});