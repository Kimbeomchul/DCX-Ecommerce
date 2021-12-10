<template>
<div id="mypage">
	<v-app id="inspire">
		<v-avatar>
			<img
				:src="user.member_image"
				alt="사용자 이미지"
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
								:src="user.member_image"
								alt="사용자 이미지"
							>
						</v-avatar>
					</v-col>
					<v-col style="font-weight: bold"
						cols="9"
					>
						<div>반갑습니다, {{ user.member_name }}님</div>
						<div>적립금: {{ user.member_savemoney | currency | won }}</div>
					</v-col>
				</v-row>

				<v-divider></v-divider>

				<v-list flat>
					<v-list-item-group>
						<v-list-item style="font-weight: bold"
							v-for="item in items"
							:key="item.title"
							color="primary"
							:to="item.to"
							@click="logout(item.to)"
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
import * as userService from '../services/userService';
import * as dialogService from '../services/dialogService';
import * as routerService from '../services/routerService';
import store from '@/store/index.js';

export default {
	name: "MyPage",
	components: {
	},
	async created() {
		this.user = await userService.getUserFromDB();
	},
	methods: {
		logout(to) {
			if(!to) {
				dialogService.confirm('정말 로그아웃 하시겠습니까?', () => {
					userService.clearUser();
					localStorage.clear();
					routerService.go('/');
					store.state.zzims = [];
					store.commit('clearZzimList');
				});
			}
		}
	},
	data: () => ({
		user: {},
		items: [
			{ title: '찜목록', to: '/zzim' },
			{ title: '주문 내역', to: '/orderedList' },
			{ title: '장바구니', to: '/cart' },
			{ title: '로그아웃' },
		],

	}),
}
</script>
