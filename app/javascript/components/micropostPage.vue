<template>
  <div id="micropost">
    <el-container>
      <el-main>
        <div class="block">
          <el-timeline v-for="m in microposts" :key="m.id">
            <el-timeline-item placement="top">
              <el-card>
                <h4>{{ m.content }}</h4>
                <p>{{ getUserName(m.user_id) }} posted {{ m.created_at }}</p>
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
      microposts: {},

      title: 'microposts',
    }
  },
  mounted () {
    axios
      .get('/api/v1/microposts.json')
      .then(response => (this.microposts = response.data))
  },
  methods: {
    getUserName: function(user_id) {
      let name = '';
      axios
        .get(`/api/v1/users/${user_id}.json`)
        .then(response => (this.name = response.data.name));
      return name;
    }
  }
}
</script>

<style scoped>
</style>
