<template>
  <HomeButton />
  <TotalShortenedLifespan />
  <FooterLink />
</template>

<script>
  import HomeButton from '../components/HomeButton.vue'
  import TotalShortenedLifespan from '../components/TotalShortenedLifespan.vue'
  import FooterLink from '../components/FooterLink.vue'

  export default {
    components: { HomeButton, TotalShortenedLifespan, FooterLink },

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