<template>
<div id="app">
  <v-app id="inspire">

    <v-sheet
      id="scrolling-techniques-7"
      class="overflow-y-auto"
      max-height="2000"
    >
      <v-container fluid style="padding-top:60px;">
        <h3 class="font-weight-black" style="margin:10px 0 10px">
          구매자 정보
        </h3>
        <v-form ref="form" >
          <div @click="execDaumPostcode()">
          <v-text-field v-model="address" placeholder="주소"><br></v-text-field>
          <v-text-field v-model="extraAddress" placeholder="건물명"><br></v-text-field>
          </div>
          <div ref="embed" style="display:none;border:1px solid;width:500px;margin:5px 0;position:relative">
            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" @click="foldDaumPostcode" alt="접기 버튼">
          </div>
          <v-text-field v-model="detailAddress" placeholder="상세주소"></v-text-field>
          <v-row>
            <v-col
            cols="12"
            sm="4"
            v-for="(phone, index) in phoneNumber"
            :key="index"
          >
            <v-text-field type="number" v-model="phoneNumber[index]" placeholder="000"></v-text-field>
            </v-col>
          </v-row>
        </v-form>

        <h3 class="font-weight-black"  style="margin-top:10px">
        주문 상세
        </h3>
        <v-expansion-panels :value="1" inset style="margin-top:10px">
          <v-expansion-panel>
            <v-expansion-panel-header>
              구매 도서
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-list three-line>
                <template v-for="(book, index) in books">
                  <v-divider :key="index" />
                  <v-list-item
                  :key="book.item_title"
                  multiple
                  >
                    <template>
                      <v-img
                      :src="book.item_image"
                      max-height="50px"
                      max-width="50px"
                      style="margin-right:10px;"
                      ></v-img>

                      <v-list-item-content>
                        <v-list-item-title v-html="book.item_title"></v-list-item-title>
                        <v-list-item-subtitle >
                          <span class="text--primary">
                            {{book.item_price | currency | won}}
                          </span>
                        </v-list-item-subtitle>
                      </v-list-item-content>
                    </template>
                  </v-list-item>
                  </template>
                </v-list>
            </v-expansion-panel-content>
          </v-expansion-panel>
          
          <v-expansion-panel>
            <v-expansion-panel-header>
              결제정보
            </v-expansion-panel-header>

            <v-expansion-panel-content>
              <v-simple-table dense>
                <template v-slot:default>
                  <tbody>
                    <tr>
                      <td class="text-left"><h3>보유 적립금</h3></td>
                      <td class="text-left"><h3>{{extraReward | currency | won}}</h3></td>
                    </tr>
                    <tr>
                      <td class="text-left"><h3>사용 가능 적립금</h3></td>
                      <td class="text-left">
                        <v-row style="margin:8px 0;">
                          <input class="input_number" type="number" v-model="useReward" @click="initTextField">
                          <v-btn style="margin-left:10px" color="primary" small @click="spendAllReward">
                              모두사용
                          </v-btn>
                        </v-row>
                      </td>
                    </tr>
                    <tr>
                      <td class="text-left"><h3>총 결제 금액</h3></td>
                      <td class="text-left"><h3>{{total | currency | won}}</h3></td>
                    </tr>
                    <tr>
                      <td class="text-left"><h3>예상 적립금</h3></td>
                      <td class="text-left"><h3>{{reward | currency | won}}</h3></td>
                    </tr>
                  </tbody>
                </template>
              </v-simple-table>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>

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
import * as userService from '../services/userService'
import * as payService from '../services/payService'
import * as utils from '../util/utils'
import * as dialogService from '../services/dialogService'
import * as routerService from '../services/routerService'

export default {
    components: {
    },
    data() {
        return {
          useReward: 0,
          user: {},
          address: '',
          extraAddress: '',
          detailAddress: '',
          phoneNumber: ['','',''],
          books: [],
        };
    },
  watch: {
    useReward() {
      // -값 들어왓을때 유효성 테스트해야됨 ㅋㅋ;;;
      if(this.useReward < 0) {
        this.useReward = 0;
      }
      if(this.useReward > this.user.member_savemoney) {
        this.useReward = this.user.member_savemoney;
      }
      if(this.useReward > this.price) {
        this.useReward = this.price;
      }
    }
  },
  computed: {
    extraReward() {
      return this.user.member_savemoney - this.useReward;
    },
    total() {
      return this.price - this.useReward;
    },
    reward() {
      return Math.ceil(this.price * 0.01);
    },
    price() {
      return this.books.reduce((acc, cur) => acc + cur.item_price, 0);
    }
  },
  async created() {
  this.user = await userService.getUserFromDB();
  this.setUserInfo(this.user.member_address);
  this.books = this.books.concat(utils.getLocalstorageItem('buyItems'));
  },
	methods: {
    setUserInfo() {
      const address = this.user.member_address;
      const phoneNumber = this.user.member_phone;
      if(phoneNumber) {
        this.phoneNumber[0] = phoneNumber.slice(0, 3);
        this.phoneNumber[1] = phoneNumber.slice(3, 7);
        this.phoneNumber[2] = phoneNumber.slice(7);
      }
      if(address) {
        let index = address.indexOf('  ');
  
        if(index !== -1) {
          this.address = address.slice(0, index);
          this.detailAddress = address.slice(index + 2);
        } else {
          let startIndex = address.indexOf('(');
          let endIndex = address.indexOf(')');
  
          this.address = address.slice(0, startIndex - 1);
          this.extraAddress = address.slice(startIndex, endIndex + 1);
          this.detailAddress = address.slice(endIndex + 2);
        }
      }
    },
    spendAllReward() {
      this.useReward = this.user.member_savemoney;
    },
    initTextField() {
      this.useReward = null;
    },
    async goPay() {
      if(this.address && this.detailAddress) {
        const address = `${this.address} ${this.extraAddress} ${this.detailAddress}`;
        const phoneNumber = this.phoneNumber.join('');
        const fail = await userService.saveUserInfo(address, phoneNumber);
        utils.setLocalstorageItem('rewards', this.user.member_savemoney + this.reward - this.useReward);
        if(!fail) {
          if(this.total !== 0) {
            await payService.pay(this.books);
          } else {
            const query = {
              data: 'success',
            };
            const tid = 'T' + utils.getRandomInt(10000000000000000000, 99999999999999999999);
            localStorage.setItem('tid', tid);
            routerService.go('/', query);
          }
        }
      } else {
          await dialogService.alert('구매자 정보를 입력해주세요');
      }
    },
    foldDaumPostcode() {
      this.$refs.embed.style.display = 'none';
    },
    execDaumPostcode() {
      new window.daum.Postcode({
          oncomplete: (data) => {
            if (this.extraAddress !== "") {
                this.extraAddress = "";
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
            this.$refs.embed.style.display = 'none';
          },
        }).embed(this.$refs.embed);
        this.$refs.embed.style.display = 'block';
      },
    },
  }
</script>

<style>
.input_number {
  width: 17%;
  box-sizing: border-box;
  border: none;
  border-bottom: 2px solid red;
  font-size: 1.17em;
  font-weight: bold;
}
</style>