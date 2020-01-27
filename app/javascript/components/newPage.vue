<template>
  <div id="new">
    <h1>アカウントを作成</h1>
    <UserForm :errors="errors" :user="user" button-name="登録する" @click="createUser"></UserForm>
  </div>
</template>

<script>
import axios from 'axios';

import UserForm from './userForm.vue';

export default {
  components: {
    UserForm
  },
  data: function () {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      errors: '',

      title: 'new',
    }
  },
  methods: {
    createUser: function() {
      axios
        .post('/api/v1/users', { user: this.user})
        .then(response => {
          let e = response.data;
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

