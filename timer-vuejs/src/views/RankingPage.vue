<template>
  <div class="top-space"></div>
  <HomeButton />
  <TimeRanking />
  <FooterLink />
</template>

<script>
  import HomeButton from '../components/HomeButton.vue'
  import TimeRanking from '../components/TimeRanking.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { HomeButton, TimeRanking, FooterLink },

    data () {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style scoped>
  .top-space {
    margin-top: 120px;
  }
</style>