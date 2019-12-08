<template>
  <div id="app-footer">
    <el-menu mode="horizontal" background-color="#545c64"
      text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="1"><router-link to="/about">About</router-link></el-menu-item>
      <el-menu-item index="2"><router-link to="/contact">Contact</router-link></el-menu-item>
      <el-menu-item index="3"><a href="http://news.railstutorial.org/">News</a></el-menu-item>
      <!-- <el-submenu index="3">
        <template v-slot:title>Log in</template>
        <el-menu-item index="3-1"><a href="https://wings.msn.to/" target="help">Author</a>
        </el-menu-item>
        <el-menu-item index="3-2"><a href="https://www.sbcr.jp/" target="help">Publisher</a>
        </el-menu-item>
      </el-submenu> -->
    </el-menu>
    <router-view/>
  </div>
</template>

<script>

</script>


<style scoped>
#app-footer {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  margin: 0 auto;
  color: #2c3e50;
  margin-top: 20px;
}

.el-menu-item a {
  color: #fff;
}
</style>
