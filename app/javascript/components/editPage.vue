<template>
  <div id="edit">
    <h1>アカウント情報の変更</h1>
    <UserForm :errors="errors" :user="user" button-name="変更する" @click="updateUser"></UserForm>
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
        id: '',
        name: '',
        email: ''
      },
      errors: '',

      title: 'edit',
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
  methods: {
    updateUser: function() {
      axios
        .patch(`/api/v1/users/${this.user.id}`,{ user: this.user})
        .then(response => {
          this.$router.push({ name: 'showPage', params: { id: this.user.id } });
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

