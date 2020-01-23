<template>
  <div id="show">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>email</th>
          <th>password_digest</th>
        </tr>
        <tr>
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.password_digest }}</td>
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
      user: {},

      title: 'show',
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  }
}
</script>

<style scoped>

</style>
