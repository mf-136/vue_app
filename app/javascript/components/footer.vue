<template>
  <div id="app-footer">
    <el-menu mode="horizontal" background-color="#28BA62" text-color="#fff" active-text-color="#ffd04b">
      <!-- <el-menu-item index="1"><router-link to="/about">アバウト</router-link></el-menu-item> -->
      <!-- <el-menu-item index="2"><router-link to="/contact">コンタクト</router-link></el-menu-item> -->
      <el-submenu index="3">
        <template slot="title">公式サイト</template>
        <el-menu-item index="2-1"><a href="https://railsguides.jp/">Rails公式</a></el-menu-item>
        <el-menu-item index="2-2"><a href="https://jp.vuejs.org/index.html">Vue.js公式</a></el-menu-item>
        <el-menu-item index="2-3"><a href="https://www.ruby-lang.org/ja/">Ruby公式</a></el-menu-item>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
</script>

<style scoped>
#app-footer {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  margin: 0 auto;
  color: #28BA62;
  margin-top: 20px;
}
.el-menu-item a {
  color: #fff;
}
</style>
