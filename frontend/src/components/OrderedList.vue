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

	<h3>구매내역</h3>
	<v-list
	subheader
	three-line
	>
		<template v-for="(item, index) in items">
			<v-subheader
			v-if="item.header"
			:key="item.header"
			v-text="item.header"
			></v-subheader>

			<v-divider
			v-else-if="item.divider"
			:key="index"
			></v-divider>

			<v-list-item
			v-else
			:key="item.title"
			>
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
			</v-list-item>
		</template>
    </v-list>
    </v-container>
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
    items: [
      { header: '2021.11.24' },
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
      { header: '2021.11.20' },
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
      { header: '2021.11.01' },
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
  }),
  }
</script>
