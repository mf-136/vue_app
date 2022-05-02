<template>
  <div id="app-header">
    <el-menu mode="horizontal" background-color="#28BA62" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="1"><router-link to="/">ホーム</router-link></el-menu-item>
      <el-menu-item index="2"><router-link to="/users/list">ユーザー</router-link></el-menu-item>
      <el-menu-item index="3"><router-link to="/microposts">つぶやき</router-link></el-menu-item>
    </el-menu>
  </div>
</template>

<script>
</script>

<style scoped>
#app-header {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  margin: 0 auto;
  color: #28BA62;
  margin-top: 10px;
  padding: 0px;
}
.el-menu-item a {
  color: #fff;
}
</style>
