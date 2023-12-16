<template>
  <HomeButton />
  <Ranking />
  <FooterLink />
</template>

<script>
  import HomeButton from '../components/HomeButton.vue'
  import Ranking from '../components/Ranking.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { HomeButton, Ranking, FooterLink },

    data () {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style scoped>
</style>