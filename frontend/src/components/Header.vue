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
				src="@/assets/lotte.png"
				width="25%"
				/>
			</router-link>
		</v-toolbar-title>
		<v-spacer></v-spacer>
		<v-btn
		icon
		to="test">
			<v-icon>mdi-thumb-up</v-icon>
		</v-btn>
		<v-btn
		icon
		to="mypage">
			<v-icon>person</v-icon>
		</v-btn>
		<v-btn
		icon
		to ="cart">
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
export default {
	name: "HeaderWrapper",
	data: () => {
		return {
		}
	},
}
</script>
