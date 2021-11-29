import Vue from 'vue';
import Vuex from 'vuex';
import { getBook, getBookList } from '../services/bookService';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
      books: [],
      id: {},
    },
    mutations: {
      setBookList(state, bookList) {
        state.books = bookList;
      },
      setBook(state, id) {
        state.id = id;
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
    async FETCH_BOOK(context, id) {
        await getBook(id)
          .then((response) => {
            context.commit('setBook', response);
          })
    }
    }
});
