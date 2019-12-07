<template>
  <div>

  <div>
<h1>Sample App</h1>
<p>
  This is the home page for the
  <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
  sample application.
</p>
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
p {
  font-size: 2em;
  text-align: center;
}
</style>
