import Vue from 'vue';
import Vuex from 'vuex';
import { getBookByTitle, getBookList } from '../services/bookService';
import { getZzimList, addZzim, deleteZzim } from '../services/zzimService';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
      books: [],
      filteredBooks: [],
      book: [],
      zzims: [],
      newCartItems: 0,
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
      setFilteredBooks(state, filteredBookList) {
        state.filteredBooks = filteredBookList;
      },
      filterBooks(state, filteredBooks) {
        state.filteredBooks = filteredBooks;
      },
      removeFromZzim: (state, id) => {
        state.zzims.forEach(el => {
          if (id == el.item_code) {
            //state.zzims.remove(el);
          }
        })
      },
      addToZzim: (state, zzim) => {
        state.zzims.push(zzim);
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
    async SAVE_FILTERBOOK(context) {
      await getBookList()
            .then(response => {
            console.log(response);
            context.commit('setFilteredBooks', response);
        })
    },
    async ADD_ZZIM(context, id) {
      await addZzim(id)
        .then(response => {
          context.commit('addToZzim', response);
        })
    },
    async REMOVE_ZZIM(context, id) {
      await deleteZzim(id)
        .then(() => {
          context.commit('removeFromZzim', id);
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
