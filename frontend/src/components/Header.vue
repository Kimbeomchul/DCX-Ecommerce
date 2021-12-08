<template>
<div id="header">
	<v-card>
		
		<v-app-bar
		absolute
		color="white"
		elevate-on-scroll
		scroll-target="#scrolling-techniques-7"
		style="justify:center;">
		<v-btn v-if="canGoBackNames.includes($route.name)"
		icon
		@click="goBack">
			<v-icon>arrow_back_ios_new</v-icon>
		</v-btn>
		
		<v-container style="width:120%">
		<v-toolbar-title class="d-flex flex-row-reverse">
			<router-link 
			to="/">
				<v-img
				src="@/assets/lotte.png"
				width="50px"
				/>
			</router-link>
		</v-toolbar-title>
		</v-container>

		<v-container v-if="isSearch" style="margin: auto 0;">
			<v-text-field v-model="inputText" placeholder="검색">
			</v-text-field>

			<v-card v-if="books.length > 0" style="max-height:400px; overflow-y: scroll; border: solid cornflowerblue; min-width:160px">
				<v-list three-line>
					<template v-for="(book, index) in books">
						<v-divider :key="index" />
						<v-list-item :key="book.item_title" multiple>
							<template>
								<v-img :src="book.item_image" max-height="50px" max-width="50px"
									style="margin-right:10px; cursor: pointer" @click="goBookDetail(book)"></v-img>
								<v-list-item-content @click="goBookDetail(book)" style="cursor: pointer">
									<v-list-item-title v-html="book.item_title"></v-list-item-title>
									<v-list-item-subtitle>
										<span class="text--primary">
											{{book.item_price | currency | won}}
										</span>
									</v-list-item-subtitle>
								</v-list-item-content>
							</template>
						</v-list-item>
					</template>
				</v-list>
			</v-card>
		</v-container>
		<v-container v-else style="visibility:hidden;margin: auto 0;">
			
		</v-container>

		<v-btn
		icon
		@click="isSearch = !isSearch">
			<v-icon>search</v-icon>
		</v-btn>
		<!-- <v-btn icon to="test">
			<v-icon>mdi-thumb-up</v-icon>
		</v-btn> -->
		<v-btn icon to="mypage">
			<v-icon>person</v-icon>
		</v-btn>
		<v-btn icon to ="cart">
		<v-badge
			:value="$store.state.newCartItems > 0"
			overlap
			color="red"
			:content= "$store.state.newCartItems"
		>
			<v-icon>shopping_bag</v-icon>
		</v-badge>
		</v-btn>
	</v-app-bar>
	</v-card>
</div>
</template>

<script>
import * as bookService from '../services/bookService'
import * as routerService from '../services/routerService'
import { EventBus } from '../main'
import { CAN_GO_BACK_NAME } from '../constants/routes'

export default {
	name: "HeaderWrapper",
	async created() {
		this.canGoBackNames = CAN_GO_BACK_NAME;
		EventBus.$on('change', () => {
			this.dataInit();
		})
		this.allBooks = await bookService.getBookList();
	},
	methods: {
		goBack() {
			console.log(this.$route);
			routerService.goback();
		},
		goBookDetail(book) {
			const path = `/book/${book.item_title}`;
			const params =  { bookTitle: `${book.item_title}` };

			this.dataInit();
			routerService.go(path, null, params)
		},
		dataInit() {
			this.isSearch = false;
			this.inputText = '';
			this.books = [];
		},
		bookSearch(searchTitle) {
			const trimSearchTitle = searchTitle.replace(' ', '');

			return this.allBooks.filter(v => {
				const trimTitle = v.item_title.replace(' ','');
				if(trimSearchTitle === trimTitle) {
					return true;
				}

				if(trimTitle.indexOf(trimSearchTitle) !== -1) {
					return true;
				} 

				return false;
			})
		}
	},
	watch: {
		inputText(newVal) {
			if(newVal.replace(' ', '') !== '') {
				this.books = this.bookSearch(newVal);
			} else {
				this.books = [];
			}
			// console.log(newVal, this.books);
		}
	},
	data: () => {
		return {
			isSearch: false,
			allBooks: [],
			searchBooks: [],
			inputText: '',
			books: [],
			canGoBackNames: []
		}
	},
}
</script>
