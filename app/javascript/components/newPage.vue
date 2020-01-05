<template>
<div>
<h1>Sign up</h1>

  <div id="form">
    <el-form label-width="120px">
      <el-form-item v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li><font color="red">{{ e }}</font></li>
        </ul>
      </el-form-item>
      
      <el-form-item label="Name">
        <el-input type="text" size="large" v-model="user.name"></el-input>
      </el-form-item>
      <el-form-item label="Email">
        <el-input type="email" size="large" v-model="user.email"></el-input>
      </el-form-item>
      <el-form-item label="Password">
        <el-input type="password" size="large" v-model="user.password"></el-input>
      </el-form-item>
      <el-form-item label="Confirmation">
        <el-input type="password" size="large" v-model="user.password_confirmation"></el-input>
      </el-form-item>
      
      <el-button type="primary"  @click.prevent="createUser">Create my account</el-button>
    <!-- .prevent と続いていることで、通常の submit で処理されるページリロードを行わないようにします。これは event.preventDefault() と同じ効果 -->
    </el-form>
  </div>

</div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      errors: ''
    }
  },
  methods: {
    createUser: function() {
      axios
        .post('/api/v1/users', { user: this.user})
        .then(response => {
          let e = response.data;
          // 詳細画面に遷移する処理。template で遷移先を定義する際は <router-link :to="..."> 
          this.$router.push({ name: 'showPage', params: { id: e.id } });
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
#form {
  margin-top: 15px;
}
</style>

