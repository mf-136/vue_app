<template>
  <div id="show">
    <el-container>
      <el-aside width="400px">
        <table>
          <tbody>
            <tr>
              <th>ID</th>
              <th>アカウント名</th>
              <th>メールアドレス</th>
            </tr>
            <tr>
              <td>{{ user.id }}</td>
              <td>{{ user.name }}</td>
              <td>{{ user.email }}</td>
            </tr>
          </tbody>
        </table>

        <el-form>
          <el-form-item v-if="errors.length != 0">
              <ul v-for="e in errors" :key="e">
                <li><font color="red">{{ e }}</font></li>
              </ul>
          </el-form-item>
          <el-form-item>
            <el-input type="textarea" placeholder="いまどうしてる？" rows="10" v-model="micropost.content"></el-input>
          </el-form-item>
          <el-row>
            <el-button type="primary" @click.prevent="createMicropost()" round>つぶやく</el-button>
          </el-row>
        </el-form>
      </el-aside>
      <el-main>
        <div class="block">
          <el-timeline v-for="m in userMicroposts" :key="m.id">
            <el-timeline-item placement="top">
              <el-card>
                <h4>{{ m.content }}</h4>
                <p>{{ user.name }} posted {{ m.created_at }}</p>
                <el-button type="primary" icon="el-icon-delete" @click="deleteMicropost(m.id)"></el-button>
              </el-card>
            </el-timeline-item>
          </el-timeline>
        </div>
      </el-main>
    </el-container>
  </div>
</template> 

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      user: {},
      micropost: {},
      userMicroposts: [{content:'',created_at:''}],
      errors: '',

      title: 'show',
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data));
    this.updateMicroposts();
  },
  methods: {
    createMicropost: function() {
      axios
        .post('/api/v1/microposts', { micropost: this.micropost, id: this.user.id})
        .then(response => {
          let e = response.data;
          this.userMicroposts.unshift(e);
          this.micropost = {};
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    deleteMicropost: function(id) {
      axios
        .delete(`/api/v1/microposts/${id}`)
        .then(response => {
          this.updateMicroposts();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
      },
      updateMicroposts: function() {
        axios
          .get(`/api/v1/microposts/${this.$route.params.id}.json`)
          .then(response => (this.userMicroposts = response.data));
      }
  }
}
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
  text-align:  center;
}
</style>
