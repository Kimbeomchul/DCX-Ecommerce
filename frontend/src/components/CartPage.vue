<template>
<div id="app">
  <v-app id="inspire">
    <HeaderWrapper />

    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
    <v-container fluid style="padding-top:60px;">

    <h3>장바구니</h3>
    <v-list three-line>
    <template v-for="(item, index) in items">
      <v-divider
      v-if="item.divider"
      :key="index"
      ></v-divider>
      
      <v-list-item
      v-else
      :key="item.title"
      v-model="buying"
      multiple
      active-class=""
      >
        <template v-slot:default="{ active }">
          <v-list-item-action>
            <v-checkbox :input-value="active"></v-checkbox>
          </v-list-item-action>
          <v-img
          :src="item.book_img"
          max-height="50px"
          max-width="50px"
          style="margin-right:10px;"
          ></v-img>

          <v-list-item-content>
            <v-list-item-title v-html="item.title"></v-list-item-title>
            <v-list-item-subtitle v-html="item.subtitle"></v-list-item-subtitle>
          </v-list-item-content>
        </template>
      </v-list-item>
      </template>
    </v-list>

	</v-container>

	<v-footer
		v-bind="localAttrs"
		:padless="padless"
	>
		<v-card
		width="100%"
		class="text-center"
		>
			<v-card-text
				class="bottom-btn"
			>
				<h4>총 {{ total_price }} 원</h4>
				<v-btn
					color="primary"
					elevation="2"
					width="90%"
				>
					바로 구매하기
				</v-btn>
			</v-card-text>
		</v-card>
	</v-footer>

    </v-sheet>

  </v-app>
</div>
</template>

<style lang="scss" scoped>
  .like-button {
    position:absolute;
    width:100%;
  }

</style>

<script>
import HeaderWrapper from "@/components/Header";

export default {
    components: {
      HeaderWrapper
    },
    data: () => ({
	total_price: 0,
    items: [
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
        title: '번역의 모험',
        subtitle: `<span class="text--primary">'번역 바이블', 12년 만에 나온 두 번째 가이드</span> `,
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
        title: '네 번의 노크',
        subtitle: `<span class="text--primary">영화계가 먼저 선택한 새로운 미스터리</span> `,
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
        title: '장면들',
        subtitle: '<span class="text--primary">손석희의 저널리즘 에세이</span>',
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
        title: '주식투자 절대 원칙',
        subtitle: '<span class="text--primary">‘주식농부’ 박영옥의 투자 철칙</span>',
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: '우리는 약속도 없이 사랑을 하고',
        subtitle: '<span class="text--primary">시인 정현우의 첫 번째 산문집</span>',
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
        title: '번역의 모험',
        subtitle: `<span class="text--primary">'번역 바이블', 12년 만에 나온 두 번째 가이드</span> `,
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
        title: '네 번의 노크',
        subtitle: `<span class="text--primary">영화계가 먼저 선택한 새로운 미스터리</span> `,
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
        title: '장면들',
        subtitle: '<span class="text--primary">손석희의 저널리즘 에세이</span>',
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
        title: '주식투자 절대 원칙',
        subtitle: '<span class="text--primary">‘주식농부’ 박영옥의 투자 철칙</span>',
      },
      { divider: true, inset: true },
      {
        book_img: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: '우리는 약속도 없이 사랑을 하고',
        subtitle: '<span class="text--primary">시인 정현우의 첫 번째 산문집</span>',
      },
    ],
	buying: [],
  }),
  computed: {
		localAttrs () {
			const attrs = {}
			attrs['fixed'] = true
			return attrs
		},
	},
  }
</script>
