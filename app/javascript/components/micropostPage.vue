<template>
  <div id="micropost">
    <el-container>
      <el-main>
        <div class="block">
          <el-timeline v-for="m in microposts" :key="m.id">
            <el-timeline-item placement="top">
              <el-card>
                <h4>{{ m.content }}</h4>
                <p>{{ m.created_at }}</p>
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
  }
}
</script>

<style scoped>
</style>
