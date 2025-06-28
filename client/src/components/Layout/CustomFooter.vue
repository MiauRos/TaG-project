<template>
  <v-footer app padless>
    <v-col class="text-center" cols="12" color="grey-lighten-4">
      {{ footerText }}
    </v-col>
  </v-footer>
</template>

<script setup>
import { computed } from 'vue'

const footerText = computed(() => {
  return `©${new Date().getFullYear()} — Made with ❤️ in SLP 🌵 by TaG Team`
})
</script>

<style scoped>
.v-footer {
  height: 25px;
  font-size: 14px;
}
</style>
