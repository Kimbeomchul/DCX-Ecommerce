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
        <h3 class="font-weight-black">
          주문하기
        </h3>
        
        <v-form
		ref="form"
		>
            <v-text-field
              ref="name"
              v-model="name"
              :rules="[() => !!name || '필수 입력항목입니다.']"
              :error-messages="errorMessages"
              label="성함"
              placeholder="홍길동"
              required
            ></v-text-field>

            <v-text-field
              ref="phoneNumber"
              v-model="name"
              :rules="[() => !! phoneNumber || '필수 입력항목입니다.']"
              :error-messages="errorMessages"
              label="전화번호"
              placeholder="010-0000-0000"
              required
            ></v-text-field>

            <v-text-field
              ref="zip"
              v-model="zip"
              :rules="[() => !! zip || '필수 입력항목입니다.']"
              label="우편번호"
              required
              placeholder="79938"
            ></v-text-field>

			<v-text-field
              ref="address"
              v-model="address"
              :rules="[
                () => !!address || '필수 입력항목입니다.',
                addressCheck
              ]"
              label="배송지 주소"
              placeholder="서울시 금천구 ..."
              required
            ></v-text-field>


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
			상품 주문하기
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
import HeaderWrapper from "@/components/Header";

export default {
    components: {
      HeaderWrapper
    },
    data: () => ({
		valid: true,
		errorMessages: '',
        name: null,
        phoneNumber: null,
        address: null,
        zip: null,
        formHasErrors: false,
	}),

	methods: {
		submit () {
		this.$v.$touch()
		},
	},
  }
</script>
