import Vue from 'vue';
import Vuex from 'vuex';
import { getBookByTitle, getBookList } from '../services/bookService';
import { getZzimList } from '../services/zzimService';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
      books: [],
      book: [],
      zzims: [],
      newCartItems: 0
    },
    mutations: {
      setBookList(state, bookList) {
        state.books = bookList;
      },
      setBook(state, book) {
        state.book = book;
      },
      setZzimList(state, zzimList) {
        state.zzims = zzimList;
      },
      setNewCartItems(state, reset = true) {
        state.newCartItems = reset ? 0 : state.newCartItems + 1
        console.log(reset, state.newCartItems);
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
      },
      async FETCH_ZZIM(context) {
        await getZzimList()
          .then((response) => {
            console.log(response);
            context.commit('setZzimList', response);
          })
      },
      INIT_NEW_CART_ITEMS(context) {
        context.commit('setNewCartItems');
      },
      ADD_NEW_CART_ITEMS(context) {
        context.commit('setNewCartItems', false);
      }
    }
});
