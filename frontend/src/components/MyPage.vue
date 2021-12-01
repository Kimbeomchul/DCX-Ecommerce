<template>
<div id="mypage">
	<v-app id="inspire">
		<HeaderWrapper />
		<v-avatar>
			<img
				src="https://cdn.vuetifyjs.com/images/john.jpg"
				alt="John"
			>
		</v-avatar>
		<v-sheet
			id="scrolling-techniques-7"
			class="overflow-y-auto"
			max-height="2000"
		>
			<v-container fluid>
				<h3>내 정보</h3>
				<v-row
				style="margin-bottom:5px;padding:10px;">
					<v-col
					cols="3"
					>
						<v-avatar>
							<img
								src="https://cdn.vuetifyjs.com/images/john.jpg"
								alt="John"
							>
						</v-avatar>
					</v-col>
					<v-col
						cols="9"
					>
						<div>반갑습니다, {{ userInfo.username }} 님</div>
						<div>적립금: {{ userInfo.reward }}</div>
					</v-col>
				</v-row>

				<v-divider></v-divider>

				<v-list flat>
					<v-list-item-group>
						<v-list-item
							v-for="item in items"
							:key="item.title"
							color="primary"
							:to="item.to"
						>
							<v-list-item-content>
								<v-list-item-title v-text="item.title"></v-list-item-title>
							</v-list-item-content>
						</v-list-item>
					</v-list-item-group>
				</v-list>
			</v-container>
		</v-sheet>
	</v-app>
</div>
</template>

<script>
import HeaderWrapper from "@/components/Header";

export default {
	name: "MyPage",
	components: {
		HeaderWrapper
	},
	data: () => ({
		userInfo: {
			username: JSON.parse(localStorage.getItem('user')).name,
			reward: 0,
		},
		items: [
			{ title: '찜목록', to: '/zzim' },
			{ title: '주문 내역', to: '/orderedList' },
			{ title: '장바구니', to: '/cart' },
			{ title: '관리자', to: '/manager' },
		],

	}),
}
</script>
