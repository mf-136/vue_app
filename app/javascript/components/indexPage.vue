<template>
  <div>
  <div>
  <el-row>
  <el-col :span="24"><div class="grid-content bg-purple-light">
  <h1>Welcome to the Sample App</h1>
  <h2>
    This is the home page for the
    <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
    sample application.
  </h2>
  <el-row><el-button type="primary"><router-link to="/signup">Sign up now!</router-link></el-button></el-row>
  </div></el-col>
  </el-row>
    <a href="http://rubyonrails.org/"><img src="../assets/rails.png" alt="Rails logo"></a>
  </div>

    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>email</th>
          <th>password_digest</th>
        </tr>
        <tr v-for="u in users" :key="u.id">
          <td>{{ u.id }}</td>
          <td>{{ u.name }}</td>
          <td>{{ u.email }}</td>
          <td>{{ u.password_digest }}</td>
        </tr>
      </tbody>
    </table>
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
      description: 'アプリ全体に適用されるミックスインの例です。'
    }
  },
  // 仮想 DOM が DOM に置き換わるタイミング
  mounted () {
    axios
      .get('/api/v1/users.json')
      .then(response => (this.users = response.data))
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
