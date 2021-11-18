<template>
  <div class="page-container">
    <md-app>
      <md-app-toolbar class="md-primary">
        <span class="md-title">My Title</span>
          <md-button class="md-icon-button">
            <md-icon>person</md-icon>
          </md-button>
          <md-badge md-content="1" md-dense>
            <md-button class="md-icon-button">
              <md-icon>shopping_basket</md-icon>
            </md-button>
          </md-badge>
      </md-app-toolbar>

      <md-app-content>
        <h2 class="main-title md-alignment-top" style="padding-top:10px;" onclick="location.href='hot-list.html'">hot item<a href="#a"></a></h2>
        <div class="md-layout-item md-layout md-gutter">
          <div class="md-layout-item">
            <img src="./images/main-list-g-04.png" alt="">
            <span>1위</span>
          </div>
          <div class="md-layout-item">
            <img src="./images/main-list-g-06.png" alt="">
            <span>2위</span>
          </div>
          <div class="md-layout-item">
            <img src="./images/main-list-g-03.png" alt="">
            <span>3위</span>
          </div>
        </div>

        <div class="md-alignment-space-around">
          <section class = "category">
            <md-button class="md-raised">카테고리1</md-button>
            <md-button class="md-raised">카테고리2</md-button>
            <md-button class="md-raised">카테고리3</md-button>
          </section>

          <section class="hot-content">
            <div class="hot-inner">
              <input type="radio" name="type" id="hot-gl" checked>
              <input type="radio" name="type" id="hot-sun">
              
              <div class="hot">
                <div class="hot-box hot-gl">
                  
                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-04.png" alt=""></span>
                      <div class="like-button">
                        <md-card-actions md-alignment="right">
                          <md-button class="md-icon-button"> 
                            <md-icon>favorite</md-icon>
                          </md-button>
                        </md-card-actions>
                      </div>
                      <p>
                        마마무 베타티타늄 안경 DAON 4910
                        <strong>49,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-06.png" alt=""></span>
                      <div class="like-button">
                        <md-card-actions md-alignment="right">
                          <md-button class="md-icon-button"> 
                            <md-icon>favorite</md-icon>
                          </md-button>
                        </md-card-actions>
                      </div>
                      <p>
                        마마무 베타티타늄 안경 DAON 4909
                        <strong>99,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-03.png" alt=""></span>
                      <div class="like-button">
                        <md-card-actions md-alignment="right">
                          <md-button class="md-icon-button"> 
                            <md-icon>favorite</md-icon>
                          </md-button>
                        </md-card-actions>
                      </div>
                      <p>
                        마마무 솔라 착용 BLUE VB 01_블루 브이비 01
                        <strong>155,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-07.png" alt=""></span>
                      <div class="like-button">
                          <md-card-actions md-alignment="right">
                            <md-button class="md-icon-button"> 
                              <md-icon>favorite</md-icon>
                            </md-button>
                          </md-card-actions>
                        </div>
                      <p>
                        마마무 휘인 착용 BLUE VB 01_블루 브이비 03
                        <strong>155,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-04.png" alt=""></span>
                      <div class="like-button">
                        <md-card-actions md-alignment="right">
                          <md-button class="md-icon-button"> 
                            <md-icon>favorite</md-icon>
                          </md-button>
                        </md-card-actions>
                      </div>
                      <p>
                        마마무 베타티타늄 안경 DAON 4910
                        <strong>49,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-06.png" alt=""></span>
                      <div class="like-button">
                        <md-card-actions md-alignment="right">
                          <md-button class="md-icon-button"> 
                            <md-icon>favorite</md-icon>
                          </md-button>
                        </md-card-actions>
                      </div>
                      <p>
                        마마무 베타티타늄 안경 DAON 4909
                        <strong>99,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-03.png" alt=""></span>
                      <div class="like-button">
                        <md-card-actions md-alignment="right">
                          <md-button class="md-icon-button"> 
                            <md-icon>favorite</md-icon>
                          </md-button>
                        </md-card-actions>
                      </div>
                      <p>
                        마마무 솔라 착용 BLUE VB 01_블루 브이비 01
                        <strong>155,000원</strong>
                      </p>
                    </div>
                  </div>

                  <div class="hot-item" onclick="location.href='item-info.html'">
                    <div class="test" style="position:relative">
                      <span><img src="./images/main-list-g-07.png" alt=""></span>
                      <div class="like-button">
                          <md-card-actions md-alignment="right">
                            <md-button class="md-icon-button"> 
                              <md-icon>favorite</md-icon>
                            </md-button>
                          </md-card-actions>
                        </div>
                      <p>
                        마마무 휘인 착용 BLUE VB 01_블루 브이비 03
                        <strong>155,000원</strong>
                      </p>
                    </div>
                  </div>

                </div>
              </div>
            </div>

          </section>
	</div>
      </md-app-content>
    </md-app>
  </div>
</template>

<style lang="scss" scoped>

  .md-app {
    border: 0.5px solid rgba(#000, .12);
  }

  .test {
    position: relative;
  }

  .like-button {
    position:absolute;
    width:100%;
  }

</style>

<script>
export default {
  name: 'MaterialIcons'
}
</script>
