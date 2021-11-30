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
        
        <v-form ref="form">
          <div @click="execDaumPostcode()">
            <v-text-field v-model="postcode" placeholder="우편번호"></v-text-field>
            <v-btn>우편번호 찾기</v-btn>
          </div>
          <v-text-field v-model="address" placeholder="주소"><br></v-text-field>
          <v-text-field v-model="detailAddress" placeholder="상세주소"></v-text-field>
          <v-row>
            <v-col
            cols="12"
            sm="4"
            v-for="(phone, index) in phoneNumber"
            :key="index"
          > 
            <v-text-field type="number" v-model="phoneNumber[index]" placeholder="000" :rules="[true]"></v-text-field>
            </v-col>
          </v-row>
        </v-form>
      </v-container>

      <v-container>
		<v-row
			align="center"
			justify="space-around"
		>
		<v-btn
			color="primary"
			@click="goPay"
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
import * as userService from '../services/userService'
import * as payService from '../services/payService'

export default {
    components: {
      HeaderWrapper
    },
    data() {
        return {
            postcode: '',
            address: '',
            extraAddress: '',
            phoneNumber: ['','',''],
            detailAddress: '',
            books: []
        };
    },
  created() {
    this.books =this.$route.query;
  },
	methods: {
    async goPay() {
      if(this.address && this.extraAddress && this.detailAddress) {
        const address = this.address + this.extraAddress + this.detailAddress;
        const phoneNumber = this.phoneNumber.join('');
        const books = JSON.parse(JSON.stringify(this.books));
        await userService.saveUserInfo(address, phoneNumber, books);
        let fail = await userService.saveUserInfo(address, phoneNumber, books);
        if(!fail) {
          await payService.pay(books)
        }

      }
    },
    execDaumPostcode() {
      new window.daum.Postcode({
          oncomplete: (data) => {
            if (this.extraAddress !== "") {
                this.extraAddress = "";
                console.log(data);
            }
            if (data.userSelectedType === "R") {
                // 사용자가 도로명 주소를 선택했을 경우
                this.address = data.roadAddress;
            } else {
                // 사용자가 지번 주소를 선택했을 경우(J)
                this.address = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                this.extraAddress += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                this.extraAddress +=
                    this.extraAddress !== ""
                    ? `, ${data.buildingName}`
                    : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (this.extraAddress !== "") {
                this.extraAddress = `(${this.extraAddress})`;
                }
            } else {
                this.extraAddress = "";
            }
            // 우편번호를 입력한다.
            this.postcode = data.zonecode;
            },
        }).open();
      },
    },
  }
</script>
