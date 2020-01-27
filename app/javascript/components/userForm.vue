<template>
  <div id="form">
    <el-form label-width="120px">
      <el-form-item v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li><font color="red">{{ e }}</font></li>
        </ul>
      </el-form-item>
      
      <el-form-item label="アカウント名">
        <el-input type="text" size="large" v-model="user.name"></el-input>
      </el-form-item>
      <el-form-item label="メールアドレス">
        <el-input type="email" size="large" v-model="user.email"></el-input>
      </el-form-item>
      <el-form-item label="パスワード">
        <el-input type="password" size="large" v-model="user.password" v-if="mask === 'password'"></el-input>
        <el-input type="text" size="large" v-model="user.password" v-if="mask === 'text'"></el-input>
      </el-form-item>
      <el-form-item label="パスワード確認">
        <el-input type="password" size="large" v-model="user.password_confirmation"></el-input>
      </el-form-item>

      <label ><input type="checkbox" v-model="mask" true-value="text" false-value="password"/>パスワードを表示する</label> 

      <el-row><el-button type="primary"  @click.prevent="$emit('click')" v-once>{{ buttonName }}</el-button></el-row>
    </el-form>
  </div>
</template>

<script>
export default {
  props: {
    user: {},
    buttonName:'',
    errors: ''
  },
  data: function () {
    return {
      mask: 'password'
    }
  }
}
</script>

<style scoped>
  .el-row {
    margin-bottom: 20px;
    text-align:center;
  }
</style>

