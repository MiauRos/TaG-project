<template>
  <v-app>
    <custom-navbar />
    <v-main>
      <router-view />
    </v-main>
    <custom-footer />
  </v-app>
</template>

<script setup>
import CustomNavbar from '@/components/Layout/CustomNavbar.vue'
import CustomFooter from '@/components/Layout/CustomFooter.vue'
</script>
