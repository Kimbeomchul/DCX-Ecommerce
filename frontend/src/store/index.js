import Vue from 'vue';
import Vuex from 'vuex';
import { getBookByTitle, getBookList } from '../services/bookService';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
      books: [],
      book: [],
    },
    mutations: {
      setBookList(state, bookList) {
        state.books = bookList;
      },
      setBook(state, book) {
        state.book = book;
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
    async FETCH_BOOK(context, title) {
        await getBookByTitle(title)
          .then((response) => {
            console.log(response);
            context.commit('setBook', response[0]);
          })
    }
    }
});
