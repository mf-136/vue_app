<template>
  <div id="index">
  <el-row>
  <el-col :span="24"><div class="grid-content bg-purple-light">
  <h1>Welcome to the Sample App</h1>
  <h2>
    This is the home page for the
    <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
    sample application.
  </h2>
  <el-row><el-button type="primary" round><router-link to="/users/new">アカウント作成</router-link></el-button></el-row>
  </div></el-col>
  </el-row>
    <a href="http://rubyonrails.org/"><img src="../assets/rails.png" alt="Rails logo"></a>
  </div>
</template> 

<script>
import axios from 'axios';

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
    text-align:center;
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
</style>
