<template>
  <div id="list">
    <table>
      <tbody>
        <tr>
          <th>アカウント名</th>
        </tr>
        <tr v-for="u in users" :key="u.id">
          <td>{{ u.name }}</td>
          <td><el-row><el-button size="mini" type="info" round><router-link v-bind:to="{ name: 'showPage', params: { id: u.id } }">詳細</router-link></el-button></el-row></td>
          <td><el-row><el-button size="mini" round><router-link v-bind:to="{ name: 'editPage', params: { id: u.id } }">編集</router-link></el-button></el-row></td>
          <td><el-row><el-button size="mini" type="danger" @click="dialogVisible = true; deleteTarget = u.id" round>削除</el-button></el-row></td>

          <el-dialog title="削除確認" :visible.sync="dialogVisible" width="30%">
            <span>本当に削除しますか？</span>
            <span slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">キャンセル</el-button>
              <el-button type="primary" @click="dialogVisible = false; deleteUser()">削除する</el-button>
            </span>
          </el-dialog>

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
      dialogVisible: false,
      deleteTarget: -1,
      errors: '',

      title: 'list',
    }
  },

  mounted () {   
    this.updateUsers();
  },
  
  methods: {
      deleteUser: function() {
        if (this.deleteTarget <= 0) {
          console.warn('deleteTarget should be grater than zero.');
          return;
      }
      axios
        .delete(`/api/v1/users/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateUsers();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
        },
        updateUsers: function() {
          axios
            .get('/api/v1/users.json')
            .then(response => (this.users = response.data))
        }
    }
}
</script>

<style scoped>
</style>
