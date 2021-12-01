<template>
<div id="header">
	<v-card>
		<v-app-bar
		absolute
		color="white"
		elevate-on-scroll
		scroll-target="#scrolling-techniques-7"
		>
		<v-toolbar-title>
			<router-link to="/">
				<v-img
				src="@/assets/book_logo.png"
				width="10%"
				/>
			</router-link>
		</v-toolbar-title>
		<v-spacer></v-spacer>
		<v-btn
		icon
		:to="{name: 'test'}">
			<v-icon>person</v-icon>
		</v-btn>
		<v-btn
		icon
		:to="{name: 'mypage'}">
			<v-icon>person</v-icon>
		</v-btn>
		<v-btn
		icon
		:to ="{name: 'cart'}">
		<v-badge
			color="red"
			:content= $store.state.total
		>
			<v-icon>shopping_bag</v-icon>
		</v-badge>
		</v-btn>
		</v-app-bar>
	</v-card>
</div>
</template>

<script>
export default {
	name: "HeaderWrapper",
	data: () => ({
	}),
}
</script>
