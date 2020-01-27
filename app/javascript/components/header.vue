<template>
  <div id="app-header">
    <el-menu mode="horizontal" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="1"><router-link to="/">Home</router-link></el-menu-item>
      <el-menu-item index="2"><router-link to="/users/list">Users</router-link></el-menu-item>
      <el-menu-item index="3"><router-link to="/microposts">Microposts</router-link></el-menu-item>
    </el-menu>
  </div>
</template>

<script>
</script>

<style scoped>
#app-header {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  margin: 0 auto;
  color: #2c3e50;
  margin-top: 20px;
}
.el-menu-item a {
  color: #fff;
}
</style>
