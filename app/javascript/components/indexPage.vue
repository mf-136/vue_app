<template>
  <div id="index">
    <el-row>
      <el-col :span="24">
        <div class="grid-content bg-purple-light">
          <h1>Sample Appへようこそ！</h1>
            <h2>このページはHomeページです。まだアカウントを作成していない人は、以下をクリックしてアカウントを作成してください。</h2>
          <el-row>
            <el-button type="primary" round><router-link to="/users/new">アカウント作成</router-link></el-button>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </div>
</template> 

<script>
export default {
  data: function () {
    return {
      users: [],
      title: 'home',
      keyword: 'mixin, vuejs, component',
      description: 'アプリ全体に適用されるミックスイン'
    }
  }
}
</script>

<style scoped>
  .el-row {
    margin-bottom: 20px;
    text-align:  center;
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
  border-radius: 4px;
  min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
</style>
