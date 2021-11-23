<template>
<div id="product-detail">
	<v-app id="inspire">
		<HeaderWrapper />

	<v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
	>

	<v-container fluid style="padding-top:60px;">
		<v-img
			height="450"
			src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
		>
			<v-btn icon>
				<v-icon>mdi-heart</v-icon>
			</v-btn>
		</v-img>

        <v-card-title>책 제목입니다</v-card-title>

		<v-card-text>
			<div>10,000원</div>
		</v-card-text>

		<v-divider class="mx-4"></v-divider>

		<v-card-text>
			<div>
			손석희 앵커가 뉴스룸에서 물러난다는 발표가 났을 때 세간이 술렁거렸다. 결은 조금 달랐지만, JTBC에 처음 발을 디딜 때도 많은 사람들이 한마디씩 입을 댔다. 한국 사회에서 행보만으로 이목을 집중시키는 무게를 가진 유일한 언론인, 그가 28년 만에 단독 저서를 출간했다.
			책은 소용돌이치는 한국 사회의 한 중간에서 손석희의 시선으로만 볼 수 있었을 장면들, 우리가 궁금했던 그 긴박한 순간들에 대한 설명을 담고 있다. 그는 글이 주관적, 개인적 사념으로 흐르는 우를 피하고자 오로지 장면들로만 책을 구성했다고 썼다. 그가 겪어낸 장면들과 그 속에 담긴 저널리즘에 대한 고민이 책의 시작부터 끝까지 담백하고 묵직하게 이어진다.
			만일 기사 가치에 따라 시청자나 독자들에게 비용을 청고하고 싶다면 그럴 만한 가치가 있는 기사를 써야 하는 시대가 올 것이다. 그것은 언론사나 그에 속한 개인의 이익을 위해 저널리즘을 '정치 운동'과 맞바꾸어 편 가르기에 몰두하거나, 혹은 '끝없는 상업성'에 갖다 바치는 것이 아닌,우리 모두가 아는 '정론'에 복무하는 것으로 살아남을 수 있는 시대다. 그런 시대가 온다고 어떻게 장담하느냐고? 그러지 못한다면 그것이야말로 합리적 시민사회에 대한 믿음을 버리는 것과 같다. 그다음은 정말 암흑이다.
			</div>
		</v-card-text>

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
				<v-btn
					color="primary"
					elevation="2"
					outlined
					style="margin-right:50px;"
				>
					장바구니에 담기
				</v-btn>
				<v-btn
					color="primary"
					elevation="2"
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
	name: "ProductDetail",
	components: {
		HeaderWrapper
	},
	data: () => ({
		selection: 1,
		padless: false,
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
