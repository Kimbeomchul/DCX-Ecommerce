<template>
<div id="header">
	<v-card>
		<v-app-bar
		absolute
		color="white"
		elevate-on-scroll
		scroll-target="#scrolling-techniques-7"
		>
<<<<<<< HEAD
		<v-toolbar-title>
			<router-link 
			to="/"
			style="text-decoration:none;color:black;"
			>
			이커머스
			</router-link>
		</v-toolbar-title>
		<v-spacer></v-spacer>
		<v-btn 
		icon
		to="mypage">
			<v-icon>person</v-icon>
		</v-btn>
		<v-btn 
		icon
		to ="cart">
		<v-badge
			color="red"
			:content=content
		>
			<v-icon>shopping_bag</v-icon>
		</v-badge>
		</v-btn>
=======
			<v-toolbar-title>Title</v-toolbar-title>
			<v-spacer></v-spacer>
			<v-btn v-on:click="goTest" icon>
				<v-icon>person</v-icon>
			</v-btn>
			<v-btn icon>
				<v-icon>person</v-icon>
			</v-btn>
			<v-btn icon>
			<v-badge
				color="red"
				:content=content
			>
				<v-icon>shopping_bag</v-icon>
			</v-badge>
			</v-btn>
>>>>>>> 3b44b890a6ad9e93278c937d87c6707d65bc891e
		</v-app-bar>
	</v-card>
</div>
</template>

<script>
import * as routerService from '../services/routerService'
import routes from '../constants/routes'
export default {
	name: "HeaderWrapper",
	data: () => ({
		content: 1
	}),
	methods: {
		goTest() {
			routerService.go(routes.TEST);
		}
	}
}
</script>
