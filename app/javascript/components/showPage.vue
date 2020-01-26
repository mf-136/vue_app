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
            <el-input type="textarea" rows="10" v-model="micropost.content"></el-input>
          </el-form-item>
          <el-row>
            <el-button type="primary" @click.prevent="createMicropost" round>つぶやく</el-button>
          </el-row>
        </el-form>
      </el-aside>
      <el-main>
        <div class="block">
          <el-timeline v-for="u in user" :key="u.id">
            <el-timeline-item timestamp="2018/4/12" placement="top">
              <el-card>
                <h4>{{ u.name }}</h4>
                <p>Tom committed 2018/4/12 20:46</p>
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
      errors: '',

      title: 'show',
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
  methods: {
    createMicropost: function() {
      axios
        .post('/api/v1/microposts', { microposts: this.micropost})
        .then(response => {
          let e = response.data;
          // 詳細画面に遷移する処理。template で遷移先を定義する際は <router-link :to="..."> 
          this.$router.push({ name: 'showPage', params: { id: e.userId } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
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
