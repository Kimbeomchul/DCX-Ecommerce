<template>
<div id="app">
  <v-app id="inspire">
    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
      <v-container fluid style="padding-top:60px;">
        <h3 class="font-weight-black">
          상품 추가
        </h3>
        <v-form
		ref="form"
		v-model="valid"
		lazy-validation
		>
			<v-text-field
			v-model="name"
			:counter="30"
			:rules="nameRules"
			label="책제목"
			required
			outlined
			></v-text-field>

			<v-select
				v-model="select"
				:items="items"
				:rules="[v => !!v || '카테고리를 선택해주세요.']"
				label="카테고리"
				required
				outlined
			></v-select>

			<v-file-input
			v-model="files"
			color="deep-purple accent-4"
			counter
			label="책 사진 업로드하기"
			multiple
			placeholder="책의 사진을 업로드해주세요."
			prepend-icon="mdi-camera"
			outlined
			:show-size="1000"
			>
				<template v-slot:selection="{ index, text }">
					<v-chip
					v-if="index < 2"
					color="deep-purple accent-4"
					dark
					label
					small
					>
					{{ text }}
					</v-chip>

					<span
					v-else-if="index === 2"
					class="text-overline grey--text text--darken-3 mx-2"
					>
					+{{ files.length - 2 }} File(s)
					</span>
				</template>
			</v-file-input>

			<v-text-field
				v-model="price"
				:rules="priceRules"
				label="가격"
				suffix=" 원"
				required
				outlined
			></v-text-field>

			<v-textarea
			v-model="detail"
			:counter="300"
			label="상세 설명"
			required
			outlined
			></v-textarea>
		</v-form>
      </v-container>

      <v-container>
		<v-row
			align="center"
			justify="space-around"
		>
		<v-btn
			color="primary"
			@click="submit"
			width="90%"
		>
			상품 추가하기
		</v-btn>
		</v-row>
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
export default {
    components: {
    },
    data: () => ({
		valid: true,
		name: '',
		nameRules: [
		v => !!v || '책 제목을 입력해주세요.',
		v => (v && v.length <= 30) || '책 제목은 30자 이하여야 합니다.',
		],
		select: null,
		files: [],
		items: [
		'시',
		'소설',
		'과학',
		'상식',
		],
		price: '',
		priceRules: [
		v => !!v || '가격을 입력해주세요.',
		v => /[0-9]/.test(v) || '숫자만 입력해주세요.',
		],
		detail: '',
	}),

	methods: {
		submit () {
		this.$v.$touch()
		},
	},
  }
</script>
