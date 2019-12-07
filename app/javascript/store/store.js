import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import { UPDATE_CURRENT, UPDATE_BOOK } from './mutation.js'

Vue.use(Vuex)

export default new Vuex.Store({  // note　ストア作成
  strict: true, // note add デプロイ前に必ず消す,tateをmutation以外で変更するのを禁止


  state: {
    books: [],
    current: null
  },


  getters: {
    bookCount(state) {
      return state.books.length
    },
    allBooks(state) {
      return state.books
    },
    getRangeByPage(state) {
      return page => {
        const SIZE = 3
        return state.books.slice((page - 1) * SIZE, (page - 1) * SIZE + SIZE)
      }
    },
    getBookById(state) {
      return id => {
        return state.books.find(book => book.id === id)
      }
    },
    current(state) {
      return state.current;
    }
  },


  mutations: {
    [UPDATE_CURRENT](state, payload) {
      state.current = payload
    },
    [UPDATE_BOOK](state, payload) {
      let b = this.getters.getBookById(payload.id)
      if (b) {
        Object.assign(b, payload)
      } else {
        state.books.push(payload)
      }
    }
  },


  actions: {
    [UPDATE_CURRENT]({ commit }, payload) {
      commit(UPDATE_CURRENT, payload)
    },
    [UPDATE_BOOK]({ commit }, payload) {
      commit(UPDATE_BOOK, payload)
    }
  },

  // add アプリ起動時とログアウト時の動作もあとで追加しておく
  // note ストアとストレージを同期する（ストアの内容はリロードでクリアされるから）
  // note ストレージ保存の為のプラグインを有効化
  plugins: [createPersistedState({
    key: 'vue-app', // note ストレージのキー,sessionStorageのキーとなりますので、他のアプリと被らないユニークな文字列にします。
    storage: localStorage //note sessionStorage（ブラウザ起動中のみ） note 既定はlocalStorage（オリジン単位：異なるタブ・ウィンドウもOK！）
    // note 他のオプション：paths で保存するstateを指定します（配列。モジュールauthor.nameなども可）
  })]


})
